class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.references :user, foreigh_key: true
      t.references :test, foreigh_key: true

      t.timestamps
    end
  end
end
