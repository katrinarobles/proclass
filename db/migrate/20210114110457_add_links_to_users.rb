class AddLinksToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :blog, :string
    add_column :users, :website, :string
  end
end
