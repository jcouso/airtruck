class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:origin_id].present? || params[:destination_id].present?
      @trips = Trip.where(city_origin_id: params[:origin_id], city_destination_id: params[:destination_id])
    else
      @trips = Trip.order("created_at DESC").limit(3)
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  # def search
  # end

  private

  def trip_params
    params.require(:trip).permit(:departure_date, :arrival_date, :departure_address, :arrival_address, :vacancies, :price)
  end
end
