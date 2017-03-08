class Seat < ApplicationRecord
 # attr_accessible :seat_number, :knowspace_id
 belongs_to :krowspace
 has_many :bookings
end
