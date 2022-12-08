class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :brand, :duration, :total_amount_payable, :option_to_purchase_fee, :description, :created_at

  has_many :reservations
end
