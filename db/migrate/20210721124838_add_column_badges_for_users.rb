class AddColumnBadgesForUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference(:users, :badges, foreigh_key: { to_table: :badges })
  end
end
