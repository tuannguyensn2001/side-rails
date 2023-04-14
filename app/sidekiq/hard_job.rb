class HardJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    Rails.logger.info "hard job done"
  end
end
