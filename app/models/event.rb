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
    matcher =
    if args[:month]
      month = args[:month].to_i
      if args[:day]
        Date.new(year, month, args[:day].to_i)
      else
        date = Date.new(year, month)
        (date.beginning_of_month)..(date.end_of_month)
      end
    else
      date = Date.new(year)
      (date.beginning_of_year)..(date.end_of_year)
    end
    where(started_at: matcher)
  end

  private

  # ended_at is by default 1 hour forward from started_at
  def default_ended_at
    self.ended_at = started_at + 1.hour if ended_at.blank?
  end

end
