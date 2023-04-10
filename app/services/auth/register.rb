# frozen_string_literal: true
require "bcrypt"
module Auth
  class Register < BaseService
    def initialize(params)
      super
      @params = params

    end

    def call
      user = User.find_by(email: @params[:email])
      if user
        add_error("user existed")
        return nil
      end

      user = User.new
      user.username = @params[:username]
      user.email = @params[:email]
      user.password = @params[:password]
      user.password = hash_password(user.password)
      if user.save
        user
        SendEmailAfterRegisterJob.perform_now(user)
      else
        add_error(user.errors.full_messages)
        nil
      end
    end

    def hash_password(password)
      BCrypt::Password.create(password)
    end


  end
end