class User < ApplicationRecord
  has_one :program
  has_many :smokes
end
