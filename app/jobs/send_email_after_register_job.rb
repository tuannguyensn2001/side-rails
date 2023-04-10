class SendEmailAfterRegisterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Rails.logger.info "send email after register  "
  end
end
