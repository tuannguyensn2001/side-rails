class TestSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_to_do, :time_start
  has_one :test_content , serializer: TestContentSerializer
end
