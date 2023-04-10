class CreateTestContents < ActiveRecord::Migration[7.0]
  def change
    create_table :test_contents do |t|
      t.integer :test_id
      t.integer :typeable_id
      t.integer :typeable

      t.timestamps
    end
  end
end
