class CreateOccurences < ActiveRecord::Migration[6.1]
  def change
    create_table :occurences do |t|
      t.date :date
      t.time :time
      t.integer :capacity
      t.integer :price
      t.string :location
      t.float :latitude
      t.float :longtitude
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
