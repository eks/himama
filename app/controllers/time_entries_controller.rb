class TimeEntriesController < ApplicationController
  before_action :set_date, only: [:create]

  def index
    @entries = current_user.time_entries
  end

  def create
    if !current_user.time_entries.last.in_progress?
      @entry = current_user.time_entries.new
      @entry.day = @date.strftime('%Y-%m-%d')
      @entry.start_at = @date.to_i
      @entry.end_at = @date.to_i
      flash_message = 'Clock In created successfuly'
    else
      @entry = current_user.time_entries.last
      @entry.end_at = @date.to_i
      flash_message = 'Clock Out created successfuly'
    end

    if @entry.save
      flash[:success] = flash_message
    end

    redirect_to time_entries_path
  end

  private

  def set_date
    @date = Time.zone.now
  end
end
