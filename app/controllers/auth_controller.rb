class AuthController < ApplicationController

  before_action :authentication, except: [:register, :login]

  def register

    service = Auth::Register.new(params)
    service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: :bad_request
      return
    end

    render json: { message: 'Register' }
  end

  def login
    service = Auth::Login.new(params)
    resp = service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: :bad_request
      return
    end

    render json: { message: 'Login', data: resp }
  end

  def get_me
    Rails.logger.info "current_user: #{@user_id}"
    service = Auth::GetMe.new(@user_id)
    user = service.call
    resp = {
      message: "success",
      data: user
    }
    render json: resp, :except=> [:password]
  end

end
