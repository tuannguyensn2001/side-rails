class AuthController < ApplicationController
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

    render json: { message: 'Login',data: resp }
  end
end
