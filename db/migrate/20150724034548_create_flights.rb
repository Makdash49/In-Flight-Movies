class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.integer :minutes
      t.string :origin
      t.string :destination

      t.timestamps null: false
    end
  end
end
