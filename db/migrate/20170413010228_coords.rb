class Coords < ActiveRecord::Migration[5.0]
  def change
      add_column :krowspaces, :lat, :string
      add_column :krowspaces, :lng, :string
  end
end
