class User < ApplicationRecord
  validates :email, :password, :username, presence: true

end
