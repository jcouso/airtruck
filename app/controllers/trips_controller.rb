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
  end

  def search
    # @trips = Trip.find(params[:origin_id], params[:destination_id])
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
