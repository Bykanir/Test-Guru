class CreatePassedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :passed_tests do |t|
      t.references :user, foreigh_key: true
      t.references :test, foreigh_key: true

      t.timestamps
    end
  end
end
