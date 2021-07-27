class AddColumnBadgesOption < ActiveRecord::Migration[6.0]
  def change
    add_column(:badges, :option, :string, null: false)
  end
end
