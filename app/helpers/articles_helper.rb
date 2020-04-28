module ArticlesHelper
  def css_class(day)
    case $days_of_the_week[day.wday]
    when '土' then
      'text-primary'
    when '日' then
      'text-danger'
    else 'text-black'
    end
  end
end
