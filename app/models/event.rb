class Event < ActiveRecord::Base

  # remove time definitions if event is all day
  before_save :remove_time_definitions, if: :all_day?
  # format time definitions for database
  before_save :set_time_format, unless: :all_day?

  # order the events by start_date
  default_scope { order :start_date }

  # requires title, start_date and end_date
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

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
    where(start_date: matcher)
  end

  private

  # remove time values in event
  def remove_time_definitions
    self.start_time = nil
    self.end_time = nil
  end

  # format time values in event
  def set_time_format
    self.start_time = start_time.try(:strftime, '%H:%M:%S')
    self.end_time = end_time.try(:strftime, '%H:%M:%S')
  end

end
