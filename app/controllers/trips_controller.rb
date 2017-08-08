class TripsController < ApplicationController
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

  private

  def trip_params
    params.require(:trip).permit(:city_origin_id, :city_destination_id)
  end
end
