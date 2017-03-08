class UpdateBookingsActive < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :active, :boolean, default: false
  end
end
