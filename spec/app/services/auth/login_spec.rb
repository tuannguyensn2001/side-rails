require "rails_helper"
require "bcrypt"

RSpec.describe Auth::Login do
  describe "#call" do
    let (:params) do
      {
        email: "tuannguyensn2001",
        password: "java2001"
      }
    end
    let (:service) { described_class.new(params, "hello") }
    context "when user is not found" do
      let (:user) { instance_double(User, id: 1, email: params[:email]) }
      before do
        # allow(Rails.application.config).to receive(:secret_key).and_return("test_secret_key")
        allow(User).to receive(:find_by).with(email: params[:email]).and_raise(ActiveRecord::RecordNotFound)
      end
      it "it raise error" do
        # service = Auth::Login.new(params,"hello")
        expect { service.call }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "password not match" do
      let (:user) { instance_double(User, id: 1, email: params[:email],password: "hello") }
      before do
        allow(User).to receive(:find_by).with(email: params[:email]).and_return(user)
        allow(service).to receive(:compare).with(any_args).and_return(false)
      end
      it "return error " do
        # expect(service).to receive(:say)
        # expect(service).to receive(:compare).with(any_args).once
        service.call
        expect(service).to have_received(:compare).once
        expect(service.errors).not_to be_empty
      end
    end


  end
end