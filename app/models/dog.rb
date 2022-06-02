class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :location, presence: true
  validates :photos, presence: true

  include PgSearch::Model
    pg_search_scope :search_by_breed_and_location,
      against: [ :breed, :location ],
      using: {
        tsearch: { prefix: true }
      }
end
