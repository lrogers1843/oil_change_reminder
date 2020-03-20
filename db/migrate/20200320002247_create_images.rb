class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.datetime :time_stamp
      t.integer :odometer_reading
      t.boolean :oil_change

      t.timestamps
    end
  end
end
