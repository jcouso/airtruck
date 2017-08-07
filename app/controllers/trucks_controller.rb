class TrucksController < ApplicationController
skip_before_action :authenticate_user!, only: :index
before_action :set_truck, only: [:show, :edit, :update, :destroy]
  def index
    @trucks = current_user.trucks
  end

  def show
  end

  def new
    @truck = Truck.new()
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def set_truck
    @truck = current_user.trucks.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :vacancies)
  end

end
