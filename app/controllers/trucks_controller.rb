class TrucksController < ApplicationController
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
    @truck = current_user.trucks.new(truck_params)
    if @truck.save
      redirect_to trucks_path(@truck)
    else
      render :new
    end
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
