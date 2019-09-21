class ChangePositionToBeIntegerInLists < ActiveRecord::Migration[5.2]
  def change
    change_column :lists, :position, :integer, using: 'position::integer'
  end
end
