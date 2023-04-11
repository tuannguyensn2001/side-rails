class TestController < ApplicationController
  # before_action :authentication

  def create
    request = params.require(:test).permit(:name,:time_to_do,:time_start)
    service = TestService::Create.new(request)


    service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: 422
    else
      render json: { message: 'ok' }
    end
  end

  def create_content
    Rails.logger.info params
    request =  params.permit(
      :test_id,
      :typeable,
      multiple_choice: [
        :file_path,
        :score,
        answers: [
          :answer,
          :score,
          :type
        ]
      ]
    )
    service = TestService::CreateContent.new(request)
    service.call
    if service.errors.any?
      render json: { errors: service.errors }, status: 422
    else
      render json: { message: 'ok' }
    end
  end
end

