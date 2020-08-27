class Program < ApplicationRecord
  belongs_to :user

  DEMO_DAY = DateTime.new(2020,7,16,7,0,0)

  def prepwork_smokes
    user.smokes.where('created_at < ?', start_time)
  end

  def number_of_days_of_program
    (DEMO_DAY - start_time).to_i
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

  def get_next_opening(date)
    cigarette_allowed_for(date)
  end
end
