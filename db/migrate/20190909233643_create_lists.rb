class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :position
      t.references :card, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
