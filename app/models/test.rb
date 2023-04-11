class Test < ApplicationRecord
  validates :name, :time_to_do, presence: true
  has_one :test_content
end
