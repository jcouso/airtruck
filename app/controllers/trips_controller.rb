class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @trips = Trip.all
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
