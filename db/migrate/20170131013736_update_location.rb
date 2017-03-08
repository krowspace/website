class UpdateLocation < ActiveRecord::Migration[5.0]
  def change
    rename_column :krowspaces, :location, :street
    add_column :krowspaces, :zip, :string
    add_column :krowspaces, :state, :string
    add_column :krowspaces, :city, :string
    add_column :krowspaces, :description, :text
  end
end
