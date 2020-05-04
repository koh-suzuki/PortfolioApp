module HealthsHelper
  def sleeping_time(h, bedtime, getup)
    if bedtime < getup
      h.sleep_at = (((getup - bedtime) / 60) /60)
    else
      h.sleep_at = (((getup - bedtime) / 60) /60) + 24
    end
  end
end
