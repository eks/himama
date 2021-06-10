class TimeEntry < ApplicationRecord
  validates :start_at, :day, presence: true
  validates :start_at, :numericality => { :only_integer => true, :less_than_or_equal_to => :end_at }
  validates :end_at, :numericality => { :only_integer => true, :greater_than_or_equal_to => :start_at }

  belongs_to :user

  def in_progress?
    (self.start_at - self.end_at) === 0
  end

  def duration
    return 0 if self.in_progress?

    humanize(self.end_at - self.start_at)
  end

  private

  def humanize(secs)
    return 0 if secs <= 0

    [[60, :seconds], [60, :minutes], [24, :hours], [Float::INFINITY, :days]].map do |count, name|
      # The divmod() function in Ruby returns integer division value and the remainder.
      secs, remainder = secs.divmod(count)

      "#{remainder.to_i} #{name}" unless remainder.to_i==0
    end.compact.reverse.join(' ')
  end
end
