class Event < ActiveRecord::Base

  # set default ended_at value to event
  before_save :default_ended_at

  # order the events by start_date
  default_scope { order :started_at }

  # requires title, started_at and ended_at
  validates :title, presence: true
  validates :started_at, presence: true

  # find all events by date
  def self.find_by_date(args = {})
    year = (args[:year] || Date.today.year).to_i
    range =
    if args[:month]
      month = args[:month].to_i
      if args[:day]
        day = args[:day].to_i
        date = DateTime.new(year, month, day)
        (date.beginning_of_day)..(date.end_of_day)
      else
        date = DateTime.new(year, month)
        (date.beginning_of_month)..(date.end_of_month)
      end
    else
      date = DateTime.new(year)
      (date.beginning_of_year)..(date.end_of_year)
    end
    where(started_at: range)
  end

  private

  # ended_at is by default 1 hour forward from started_at
  def default_ended_at
    self.ended_at = started_at + 1.hour if ended_at.blank?
  end

end
