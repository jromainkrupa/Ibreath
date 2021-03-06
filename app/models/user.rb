class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum user_status: {
    created: 'created',
    pairing_done: 'pairing_done',
    in_prepwork: 'in_prepwork',
    ready_to_launch: 'ready_to_launch',
    in_program: 'in_program',
    program_finished: 'program_finished'
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :smokes
  has_one :last_smoke, -> { order(created_at: :desc).limit(1) }, class_name: 'Smoke'
  has_one :program

  def get_number_of_smoke(date)
    smokes.where(created_at: date.at_beginning_of_day..date.at_end_of_day).count
  end

  def prepwork_smokes
    self.smokes.where('created_at < ?' , Date.today)
  end

  def get_hours_where_user_smoke
    hours = Hash.new(0)
    self.prepwork_smokes.each do |smoke|
      23.times do |i|
        if smoke.created_at.hour == i
          hours[i] += 1
        end
      end
    end
    return hours
  end

  def hourly_coefficients
    hours = self.get_hours_where_user_smoke
    hours.each do |key, value|
      hours[key] = (value / prepwork_smokes.count.to_f).round(3)
    end
  end

  def average_smoke
    (prepwork_smokes.count / 7).round
  end
end
