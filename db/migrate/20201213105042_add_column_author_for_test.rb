class AddColumnAuthorForTest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :author, foreigh_key: { to_table: :users })
  end
end
