class AddOilMileageToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :oil_mileage, :integer
  end
end
