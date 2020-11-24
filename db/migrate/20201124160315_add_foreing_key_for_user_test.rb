class AddForeingKeyForUserTest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:user_tests, :tests, foreign_key: true)
    add_reference(:user_tests, :users, foreign_key: true)
  end
end
