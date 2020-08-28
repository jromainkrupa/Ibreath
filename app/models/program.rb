class Program < ApplicationRecord
  belongs_to :user

  DEMO_DAY = DateTime.new(2020,7,16,10,0,0)

  def prepwork_smokes
    user.smokes.where('created_at < ?', start_time)
  end

  def number_of_days_of_program
    (Date.current - start_time).to_i
  end

  def cigarette_allowed_for(date)
    program_day = get_program_day(date)
    (-average_smoke.fdiv(30) * (program_day + 1) + average_smoke).round
  end

  def average_smoke
    (prepwork_smokes.count / 7).round
  end

  def get_program_day(date)
    (date - start_time).to_i
  end

  def get_next_opening

  end

  def get_spared_cigarettes(date)
    cigarette_allowed_for(date) - smoked_cigarette(date).count
  end

  def get_time_from_last_smoke_to_evening(date)
    #TIME_OF_EVENING - time_of_last_smoke(date)
  end

  def time_of_last_smoke(date)
    user.smokes.where(created_at: date).last.created_at
  end

  def get_spread(date)
    ((Time.now.at_end_of_day - 2.hours - user.last_smoke.created_at) / (cigarette_allowed_for(date) - smoked_cigarette(date).count)).fdiv(60).round()
  end

  def smoked_cigarette(date)
    user.smokes.where(created_at: date)
  end

  def get_most_important_smokes(date)
    hours = user.hourly_coefficients
    cigarette_allowed_for = user.program.cigarette_allowed_for(date)
    sorted_by_value_ar_of_ar = hours.sort_by do |key, value|
      -value
    end
    sorted_by_key_ar_of_ar = sorted_by_value_ar_of_ar.first(cigarette_allowed_for).to_h.sort_by do |key, value|
      key
    end
    sorted_by_key_ar_of_ar.to_h
  end

  def get_day_ordanilizer(date)
    if date.day == (1 || 21)
      "st"
    elsif date.day == (2 || 22)
      "nd"
    elsif date.day == (3 || 23)
      "rd"
    else
      "th"
    end
  end
end
