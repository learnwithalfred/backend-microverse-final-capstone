class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: params[:user_id])

    render json: @reservations
  end

  def show; end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :car_id, :date, :city)
  end
end
