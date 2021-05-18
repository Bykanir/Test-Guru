class AddColumnHashIdInGists < ActiveRecord::Migration[6.0]
  def change
    add_column(:gists, :hash_id, :string)
  end
end
