class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  layout "landing-page", only: [ :index ]
  def index
    if params[:origin_id].present? || params[:destination_id].present?
        if params[:origin_id].blank?
          @trips = Trip.where(city_destination_id: params[:destination_id])
        elsif params[:destination_id].blank?
          @trips = Trip.where(city_origin_id: params[:origin_id])
        else
          @trips = Trip.where(city_origin_id: params[:origin_id], city_destination_id: params[:destination_id])
        end
      else
      @trips = Trip.order("created_at DESC").limit(3)
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @order = Order.new
    @cities = []

    origin = @trip.city_origin
    destination = @trip.city_destination

    if origin.latitude.nil? || origin.longitude.nil?
      origin.geocode
      origin.save
    end

    if destination.latitude.nil? || destination.longitude.nil?
      destination.geocode
      destination.save
    end

    @cities << @trip.city_origin
    @cities << @trip.city_destination
    @hash = Gmaps4rails.build_markers(@cities) do |city, marker|
      marker.lat city.latitude
      marker.lng city.longitude
    end
  end

  def search
    if params[:origin_id].present? || params[:destination_id].present?
        if params[:origin_id].blank?
          @trips = Trip.where(city_destination_id: params[:destination_id])
        elsif params[:destination_id].blank?
          @trips = Trip.where(city_origin_id: params[:origin_id])
        else
          @trips = Trip.where(city_origin_id: params[:origin_id], city_destination_id: params[:destination_id])
        end
      else
      @trips = Trip.order("created_at DESC")
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:departure_date, :arrival_date, :departure_address, :arrival_address, :vacancies, :price)
  end
end
