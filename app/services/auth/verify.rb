require "jwt"
  module Auth
    class Verify  < BaseService
      def initialize(token)
        super
        @token = token
      end

      def call
        JWT.decode(@token,Rails.application.config.secret_key,true)
      end
    end
  end
