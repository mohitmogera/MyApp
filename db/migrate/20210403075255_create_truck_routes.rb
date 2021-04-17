class CreateTruckRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_routes do |t|
      t.references :truck, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.date :start_date

      t.timestamps
    end
  end
end
