class OrdersController < ApplicationController

   def index
    @orders = current_user.orders
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @order = Order.new(user:current_user, trip: @trip)
    @order.trip = @trip
    @order.save
    redirect_to orders_path
  end

end

