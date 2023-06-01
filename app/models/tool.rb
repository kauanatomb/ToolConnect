class Tool < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, :description, :address, presence: true
  validates :name, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
