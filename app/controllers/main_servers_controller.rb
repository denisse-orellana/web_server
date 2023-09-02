class MainServersController < ApplicationController
  before_action :set_main_server, only: [:edit, :update, :destroy]

  def index 
    @main_servers = MainServer.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private 

  def set_main_server
    @main_server = MainServer.find(params[:id])
  end
end
