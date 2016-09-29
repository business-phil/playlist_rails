class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
