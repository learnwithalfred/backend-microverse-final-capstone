class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :city, presence: true, length: { minimum: 1 }
  validates :date, presence: true
end
