class Event < ActiveRecord::Base

  before_save :remove_time_if_all_day # line 16

  # order the events by start_date
  default_scope { order :start_date }

  # requires title, start_date and end_date
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  private

  # remove time definitions if event is all day
  def remove_time_if_all_day
    if all_day?
      self.start_time = nil
      self.end_time = nil
    end
  end

end
