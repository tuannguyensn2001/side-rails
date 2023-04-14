class TestContentSerializer < ActiveModel::Serializer
  attributes :id, :test_id, :testable_type, :testable_id,:created_at,:updated_at,:testable

  # belongs_to :testable , polymorphic: true

end
