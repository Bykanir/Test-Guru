class AddReferencesBadgesRulesUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference(:badges, :rule, foreigh_key: { to_table: :rules })
    add_reference(:rules, :badge, foreigh_key: { to_table: :badges })
    add_reference(:badges, :users, foreigh_key: { to_table: :users })
    add_reference(:users, :badges, foreigh_key: { to_table: :badges })
  end
end
