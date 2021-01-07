class AddRepeatToOccurences < ActiveRecord::Migration[6.1]
  def change
    add_column :occurences, :repeat, :string, default: 'never'
    add_column :occurences, :end_date, :string
  end
end
