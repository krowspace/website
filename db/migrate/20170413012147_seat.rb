class Seat < ActiveRecord::Migration[5.0]
  def change
    add_column :seats, :description, :text
    add_column :seats, :amenities, :text
    add_column :seats, :price, :string
  end
end
