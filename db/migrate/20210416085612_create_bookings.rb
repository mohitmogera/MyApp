class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.decimal :quantity_in_kg, precision: 13, scale: 3
      t.references :user, null: false, foreign_key: true
      t.references :truck_route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
