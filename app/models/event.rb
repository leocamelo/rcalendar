class Event < ActiveRecord::Base
  attr_accessor :alert

  before_save :default_ended_at, if: 'ended_at.blank?'

  default_scope { order :started_at }

  validates :title, presence: true
  validates :started_at, presence: true

  def self.find_by_date(options = {})
    year = (options[:year] || Date.today.year).to_i
    range =
      if options[:month].present?
        month = options[:month].to_i
        if options[:day].present?
          day = options[:day].to_i
          date = Date.new(year, month, day)
          (date.beginning_of_day)..(date.end_of_day)
        else
          date = Date.new(year, month)
          (date.beginning_of_month)..(date.end_of_month)
        end
      else
        month = Date.today.month
        date = Date.new(year, month)
        (date.beginning_of_month)..(date.end_of_year)
      end
    where(started_at: range)
  end

  def has_conflicted_event?
    conflicteds = Event.where.not(id: self.id).select do |event|
      event.started_at <= ended_at || event.ended_at >= started_at
    end
    conflicteds.any?
  end

  def as_json(options = {})
    extensions = {
      start_date: started_at.to_date.to_s,
      start_time: started_at.strftime('%H:%M:%S'),
      end_date: ended_at.to_date.to_s,
      end_time: ended_at.strftime('%H:%M:%S')
    }
    super(options.merge(methods: :alert)).merge(extensions)
  end

  private

  def default_ended_at
    self.ended_at = started_at + 1.hour
  end
end
