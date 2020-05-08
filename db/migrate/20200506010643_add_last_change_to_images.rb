class AddLastChangeToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :last_change, :integer
  end
end
