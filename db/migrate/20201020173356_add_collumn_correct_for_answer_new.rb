class AddCollumnCorrectForAnswerNew < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :boolean, null: false)
  end
end
