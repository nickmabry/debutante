module ApplicationHelper
  def alert_class(name)
    case name.to_s
    when "notice"
      "alert alert-success"
    when "alert"
      "alert alert-error"
    else
      "alert"
    end
  end
end
