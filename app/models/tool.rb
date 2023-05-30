class Tool < ApplicationRecord
  belongs_to :user
  validates :name, :description, :address, presence: true
  validates :name, uniqueness: true
end
