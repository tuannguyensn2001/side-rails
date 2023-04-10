require "jwt"
module Service
  module Auth
    class Verify  < Service::BaseService
      def initialize(token)
        super
        @token = token
      end

      def call
        JWT.decode(@token,Rails.application.config.secret_key,true)
      end
    end
  end
end