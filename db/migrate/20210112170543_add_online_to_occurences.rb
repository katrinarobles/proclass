class AddOnlineToOccurences < ActiveRecord::Migration[6.1]
  def change
    add_column :occurences, :online, :boolean, :default => false
  end
end
