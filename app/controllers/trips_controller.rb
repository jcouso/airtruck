class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @trips = Trip.where(city_origin_id: params[:origin_id], city_destination_id: params[:destination_id])
  end

  def show
  end

  def new
  end

  def edit
  end
end
