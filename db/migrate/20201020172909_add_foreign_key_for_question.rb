class AddForeignKeyForQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference(:questions, :test_id)
  end
end
