class AddForeignKeyForTest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :categiry_id)
  end
end
