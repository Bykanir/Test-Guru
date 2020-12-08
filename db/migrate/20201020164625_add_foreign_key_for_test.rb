# frozen_string_literal: true

class AddForeignKeyForTest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :category, foreign_key: true)
  end
end
