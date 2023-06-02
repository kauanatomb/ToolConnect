class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  validates :rental_start, :rental_end, presence: true
  enum status: { Pending: 0, Accepted: 1, Declined: 2 }
end
