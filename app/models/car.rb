class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy

  MAX_LENGTH = 250
  MIN_NUM = 1
  MAX_NUM = 100_000_000

  validates :name, presence: true, length: { minimum: MIN_NUM, maximum: MAX_LENGTH }
  validates :brand, presence: true, length: { minimum: MIN_NUM, maximum: MAX_LENGTH }
  validates :image, presence: true, length: { minimum: MIN_NUM }
  validates :duration, presence: true,
                       numericality: { greater_than_or_equal_to: MIN_NUM, less_than_or_equal_to: MAX_NUM }
  validates :total_amount_payable, presence: true,
                                   numericality: { greater_than_or_equal_to: MIN_NUM, less_than_or_equal_to: MAX_NUM }
  validates :option_to_purchase_fee, presence: true,
                                     numericality: { greater_than_or_equal_to: MIN_NUM, less_than_or_equal_to: MAX_NUM }
end
