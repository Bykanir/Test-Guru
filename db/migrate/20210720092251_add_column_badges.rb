class AddColumnBadges < ActiveRecord::Migration[6.0]
  def change
    add_column(:badges, :test, :string)
    add_column(:badges, :level, :string)
    add_column(:badges, :category, :string)
  end
end
