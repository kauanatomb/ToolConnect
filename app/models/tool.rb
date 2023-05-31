class Tool < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, :description, :address, presence: true
  validates :name, uniqueness: true
end
