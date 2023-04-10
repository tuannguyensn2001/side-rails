class TestController < ApplicationController
  # before_action :authentication

  def create
    service = Service::Test::Create.new(params)
    service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: 422
    else
      render json: { message: 'ok' }
    end
  end
end

