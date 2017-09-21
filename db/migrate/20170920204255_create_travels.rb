class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
      t.string :origin
      t.string :destination
      t.references :vehicle
      t.references :passenger

      t.timestamps
    end
  end
end
