class AddColumnToOccurences < ActiveRecord::Migration[6.1]
  def change
    add_column :occurences, :date, :string
  end
end
