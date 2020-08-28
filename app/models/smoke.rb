class Smoke < ApplicationRecord
  belongs_to :user

  scope :today, -> { where(created_at: Date.current.at_beginning_of_day..Date.current.at_end_of_day) }
end
