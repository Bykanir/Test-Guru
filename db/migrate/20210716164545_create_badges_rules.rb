class CreateBadgesRules < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_rules do |t|
      t.references :badge, foreigh_key: true
      t.references :rule, foreigh_key: true

      t.timestamps
    end
  end
end
