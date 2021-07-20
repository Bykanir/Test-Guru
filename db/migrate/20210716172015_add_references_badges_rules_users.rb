class AddReferencesBadgesRulesUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference(:badges, :rule, foreigh_key: { to_table: :rules })
  end
end
