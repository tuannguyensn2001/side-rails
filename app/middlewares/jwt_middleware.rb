# frozen_string_literal: true

class JwtMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info "in middleware"
    @app.call(env)
  end
end
