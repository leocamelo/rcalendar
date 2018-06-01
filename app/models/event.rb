class Event < ActiveRecord::Base
  attr_accessor :alert

  before_save :set_default_ended_at, if: 'ended_at.blank?'

  validates :title, presence: true
  validates :started_at, presence: true

  def self.by_date(options = {})
    year = (options[:year] || Date.today.year).to_i

    range =
      if options[:month].present?
        month = options[:month].to_i
        if options[:day].present?
          day = options[:day].to_i
          Date.new(year, month, day).all_day
        else
          Date.new(year, month).all_month
        end
      else
        month = Date.today.month
        Date.new(year, month).all_month
      end

    where(started_at: range)
  end

  def has_conflicted_event?
    has_conflict = ['started_at <= ? OR ended_at >= ?', ended_at, started_at]
    self.class.where.not(id: id).where(*has_conflict).exists?
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

  def set_default_ended_at
    self.ended_at = started_at + 1.hour
  end
end
