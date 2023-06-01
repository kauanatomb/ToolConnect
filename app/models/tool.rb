class Tool < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :description, :address, presence: true
end
