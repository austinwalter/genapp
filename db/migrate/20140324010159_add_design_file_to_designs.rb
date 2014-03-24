class AddDesignFileToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :design_file, :string
  end
end
