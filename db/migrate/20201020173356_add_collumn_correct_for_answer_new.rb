# frozen_string_literal: true

class AddCollumnCorrectForAnswerNew < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :boolean, null: false)
  end
end
