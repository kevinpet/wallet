module ApplicationHelper
  def dt(datetime)
    datetime.strftime("%Y-%m-%d %H:%M")
  end
end
