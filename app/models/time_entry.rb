class TimeEntry < ApplicationRecord
  validates :start_at, :day, presence: true
  validates :start_at, :numericality => { :only_integer => true, :less_than => :end_at }
  validates :end_at, :numericality => { :only_integer => true, :greater_than => :start_at }

  belongs_to :user
end
