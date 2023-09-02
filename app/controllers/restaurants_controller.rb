class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.device_servers.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @success = @restaurant.save if @restaurant.present?

    if @restaurant.valid?
      @main_server = MainServer.new(restaurant_id: @restaurant.id)
      @main_server.save
      @restaurant.create_server(@restaurant)
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @restaurant.update(restaurant_params)
    @success = @restaurant.valid?

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @success = @restaurant.update_column(:deleted_at, Time.zone.now)

    respond_to do |format|
      format.js
    end
  end

  private 

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name, 
      :status,
      :deleted_at,
      device_servers_attributes: [
        :id,
        :name,
        :status,
        :_destroy
      ]
    )
  end
end
