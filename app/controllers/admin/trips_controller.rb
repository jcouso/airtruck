class Admin::TripsController < ApplicationController
  # before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def list
    @truck = Truck.find(params[:truck_id])
    @trips = current_user.trips
    @trips.truck = @truck
  end

  def new
    @truck = Truck.find(params[:truck_id])
    @trip = Trip.new
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @trip = current_user.trips.new(trip_params)
    @trip.truck = @truck
    if @trip.save
      redirect_to admin_trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @truck = Truck.find(params[:truck_id])
    @trip.truck = @truck
  end

  def update
    @truck = Truck.find(params[:truck_id])
    @trip = current_user.trips.update(trip_params)
    @trip.truck = @truck
    if
      redirect_to admin_trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to admin_trips_path
  end

  private

  # def set_trip
  #   @trip = current_user.trips.find(params[:id])
  # end

  def trip_params
    params.require(:trip).permit(:departure_date, :arrival_date, :departure_address, :arrival_address, :vacancies, :price)
  end
end
