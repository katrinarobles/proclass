class RemoveColumnToCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :capacity
    remove_column :courses, :price
  end
end
