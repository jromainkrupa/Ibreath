class Program < ApplicationRecord
  belongs_to :user

  DEMO_DAY = DateTime.new(2020,7,16,7,0,0)
end
