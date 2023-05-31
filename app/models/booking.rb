class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  validates :rental_start, :rental_end, presence: true
  enum status: [:pending, :accepted, :declined]
end
