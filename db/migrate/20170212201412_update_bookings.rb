class UpdateBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :firstName, :string
    add_column :bookings, :lastName, :string
    add_column :bookings, :company, :string
    add_column :bookings, :streetAddress, :string
    add_column :bookings, :city, :string
    add_column :bookings, :state, :string
    add_column :bookings, :zip, :string
    add_column :bookings, :licenseNumber, :string
    add_column :bookings, :licenseState, :string
    add_column :bookings, :paymentType, :string
    add_column :bookings, :cardName, :string
    add_column :bookings, :cardNumber, :string
    add_column :bookings, :expirationDate, :string
    add_column :bookings, :cvv, :string
    add_column :bookings, :email, :string
    add_column :bookings, :cost, :string
  end
end
