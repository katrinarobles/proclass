class RemoveColumnsToOccurences < ActiveRecord::Migration[6.1]
  def change
    remove_column :occurences, :date
    remove_column :occurences, :time
  end
end
