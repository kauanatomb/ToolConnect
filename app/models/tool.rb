class Tool < ApplicationRecord
  belongs_to :user 
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, :description, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
