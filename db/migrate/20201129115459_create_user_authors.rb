class CreateUserAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :user_authors do |t|
      t.references :user, foreigh_key: true


      t.timestamps
    end
  end
end
