class Krowspace < ApplicationRecord
  has_many :seats
  accepts_nested_attributes_for :seats, reject_if: :all_blank, allow_destroy: true
end
