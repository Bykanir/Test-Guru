class CreateBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users do |t|
      t.references :badge, foreigh_key: true
      t.references :user, foreigh_key: true

      t.timestamps
    end
  end
end
