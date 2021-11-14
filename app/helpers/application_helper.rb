module ApplicationHelper
  def optimized_duration(duration)
    if duration < 60
      "#{duration} minutes"
    elsif duration < 1440
      "#{duration / 60} heures " + ("#{duration % 60} minutes" unless duration % 60 == 0)
    else
      days = duration / 1440
      duration -= days * 1440
      hours = duration / 60
      "#{days} jours" + (" et #{hours} heures" unless hours == 0)
    end
  end
end
