class AddForeignKeyForAnswer < ActiveRecord::Migration[6.0]
  def change
    add_reference(:answers, :question_id)
  end
end
