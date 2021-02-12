class CreateFakeBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_bookings do |t|
      t.string :fake_first_name
      t.string :fake_last_name
      t.string :fake_email
      t.references :occurence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
