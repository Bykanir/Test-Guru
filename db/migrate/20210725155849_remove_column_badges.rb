class RemoveColumnBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column(:badges, :test)
    remove_column(:badges, :level)
    remove_column(:badges, :category)
  end
end
