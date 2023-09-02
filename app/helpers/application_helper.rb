module ApplicationHelper
  def status_color(instance)
    if instance.status == 'ok'
      class_name = 'badge bg-success'
    elsif instance.status == 'warning'
      class_name = 'badge bg-warning'
    elsif instance.status == 'error'
      class_name = 'badge bg-danger'
    end

    return raw("#{class_name}")
  end
end
