class ApplicationController < ActionController::API

  def authentication
    token = request.headers['Authorization']
    unless token
      render json: { errors: 'Token not found' }, status: :bad_request
      return
    end
    unless token.match(/^Bearer (.+)/)
      render json: { errors: 'Token not valid' }, status: :bad_request
      return
    end
    token = $1
    Rails.logger.info "token #{token}"
    service = Auth::Verify.new(token)

    result = service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: :bad_request
      return
    end
    data = result[0]["data"]
    @user_id = data["user_id"]
  end
end
