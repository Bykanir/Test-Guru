class AddColumnCreatedTestForUser < ActiveRecord::Migration[6.0]
  def change
    add_reference(:users, :created_tests, foreigh_key: { to_table: :tests })
  end
end
