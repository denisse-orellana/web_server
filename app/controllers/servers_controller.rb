class ServersController < ApplicationController
  def index
    @servers = Server.all.order(updated_at: :desc)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
