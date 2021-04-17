class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.references :origin, null: false, foreign_key: {to_table: :locations}
      t.references :destination, null: false, foreign_key: {to_table: :locations}

      t.timestamps
    end
  end
end
