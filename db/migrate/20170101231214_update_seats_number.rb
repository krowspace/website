class UpdateSeatsNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :krowspaces, :seats, :seat_number
  end
end
