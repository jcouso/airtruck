class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
<<<<<<< HEAD
    @trips = Trip.where(city_origin_id: params[:origin_id], city_destination_id: params[:destination_id])
=======
    @trips = Trip.all
>>>>>>> 77191ccb7b43b0943d7425e344429f8739a14c87
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
