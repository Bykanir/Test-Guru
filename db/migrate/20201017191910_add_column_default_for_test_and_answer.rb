class AddColumnDefaultForTestAndAnswer < ActiveRecord::Migration[6.0]
  def change
    change_column(:tests, :level, :integer, default: 0)
    change_column(:answers, :correct, :string, default: 'not true')
  end
end
