class AddColumnUsersForBadges < ActiveRecord::Migration[6.0]
  def change
    add_reference(:badges, :users, foreigh_key: { to_table: :users })
  end
end
