class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum user_status: {
    created: 'created',
    pairing_done: 'pairing_done',
    in_prepwork: 'in_prepwork',
    in_program: 'in_program',
    program_finished: 'program_finished'
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :smokes
  has_one :program

end
