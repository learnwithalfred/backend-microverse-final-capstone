class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date, :city
  belongs_to :car
end
