class AddProcessingStatusToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :processing_status, :string, default: "queued" #advises the db of the default, not the rails app, which is covered in the Image model

    reversible do |dir| #updates all existing images
      dir.up do
        Image.update_all(processing_status: "completed")
      end
      dir.down do
      end
    end
  end

end
