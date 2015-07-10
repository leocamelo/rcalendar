class Event < ActiveRecord::Base

  # requires title, start_date and end_date
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
