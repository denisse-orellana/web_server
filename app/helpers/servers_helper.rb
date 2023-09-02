module ServersHelper
  def status_color_server(server)
    if server.server_status == 'ok'
      class_name = 'badge bg-success'
    elsif server.server_status == 'error'
      class_name = 'badge bg-danger'
    end

    return raw("#{class_name}")
  end

  def status_color_restaurant(server)
    if server.restaurant_status == 'ok'
      class_name = 'badge bg-success'
    elsif server.restaurant_status == 'warning'
      class_name = 'badge bg-warning'
    elsif server.restaurant_status == 'error'
      class_name = 'badge bg-danger'
    end

    return raw("#{class_name}")
  end
end
