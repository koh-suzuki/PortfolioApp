module ApplicationHelper
  def full_title(page_name = "")
    base_title = "My Log"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
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
