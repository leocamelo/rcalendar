class Event < ActiveRecord::Base

  # remove time definitions if event is all day
  before_save :remove_time_definitions, if: :all_day?

  # order the events by start_date
  default_scope { order :start_date }

  # requires title, start_date and end_date
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  private

  # remove time values in event
  def remove_time_definitions
    self.start_time = nil
    self.end_time = nil
  end

end
