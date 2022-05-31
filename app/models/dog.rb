class Dog < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  # validates :sex, presence: true
  validates :location, presence: true
  validates :photos, presence: true
end
