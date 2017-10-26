class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :rental_id
      t.string :email
      t.date :start_at
      t.date :end_at
      t.integer :price

      t.timestamps
    end
  end
end
