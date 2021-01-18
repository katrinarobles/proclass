class AddCoordinatesToOccurences < ActiveRecord::Migration[6.1]
  def change
    add_column :occurences, :latitude, :float
    add_column :occurences, :longitude, :float
  end
end
