class ChangeColumnNullTableBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:badges, :name, false)
    change_column_null(:badges, :picture, false)
    change_column_null(:badges, :rule_id, false)
  end
end
