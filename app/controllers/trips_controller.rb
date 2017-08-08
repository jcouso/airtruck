class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @truck = Truck.find(params[:truck_id])
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.truck = Truck.find(params[:truck_id])
    if @trip.save
      redirect_to truck_path(@truck)
    else
      render :new
    end
  end

  def edit

  end

  # def search
  # end

  private

  def trip_params
    params.require(:trip).permit(:departure_date, :arrival_date, :departure_address, :arrival_address, :vacancies, :price)
  end
end
