class Event < ActiveRecord::Base

  # order the events by start_date
  default_scope order :start_date

  # requires title, start_date and end_date
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
