class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.datetime :scheduled_time
      t.string :message

      t.timestamps
    end
  end
end
