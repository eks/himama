class TimeEntry < ApplicationRecord
  validates :start_at, :day, presence: true
  validates :start_at, :numericality => { :only_integer => true, :less_than_or_equal_to => :end_at }
  validates :end_at, :numericality => { :only_integer => true, :greater_than_or_equal_to => :start_at }

  belongs_to :user

  def in_progress?
    (self.start_at - self.end_at) === 0
  end
end
