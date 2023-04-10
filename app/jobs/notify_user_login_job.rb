class NotifyUserLoginJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    Rails.logger.info "notify user login"
  end
end
