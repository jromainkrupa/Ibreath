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
  has_one :program

  def get_number_of_smoke(date)
    self.smokes.where(created_at: date).count
  end

end
