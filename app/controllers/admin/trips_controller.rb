class Admin::TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def show
    @trip = current_user.trips.find(params[:id])
  end

  def list
    @truck = Truck.find(params[:truck_id])
    @trips = @truck.trips
  end

  def new
    @truck = Truck.find(params[:truck_id])
    @trip = Trip.new
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @trip = current_user.trips.new(trip_params)
    @trip.truck = @truck
    binding.pry
    if @trip.truck.save!
      redirect_to list_admin_truck_trips_path(@truck)
    else
      render :new
    end
  end

  def edit
    @trip  = Trip.find(params[:id])
    @truck = @trip.truck
  end

  def update
    @trip = Trip.find(params[:id])
    @truck = @trip.truck
    if @trip.update(trip_params)
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

  def trip_params
    params.require(:trip).permit(:departure_date, :departure_address, :arrival_date, :arrival_address, :vacancies, :price)
  end
end
