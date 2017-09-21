class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :color
      t.string :model
      t.string :licence_plate
      t.integer :category

      t.timestamps
    end
  end
end
