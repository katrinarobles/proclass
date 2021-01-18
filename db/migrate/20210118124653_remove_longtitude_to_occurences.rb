class RemoveLongtitudeToOccurences < ActiveRecord::Migration[6.1]
  def change
    remove_column :occurences, :latitude
    remove_column :occurences, :longtitude
  end
end
