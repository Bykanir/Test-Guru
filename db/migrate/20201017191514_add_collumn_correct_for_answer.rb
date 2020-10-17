class AddCollumnCorrectForAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :string)
  end
end
