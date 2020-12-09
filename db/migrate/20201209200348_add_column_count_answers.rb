class AddColumnCountAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column(:questions, :count_answers, :integer)
  end
end
