class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :plate_no
      t.decimal :capacity_in_kg, precision: 13, scale: 3

      t.timestamps
    end
  end
end
