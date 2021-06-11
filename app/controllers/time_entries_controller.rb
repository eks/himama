class TimeEntriesController < ApplicationController
  before_action :set_date, only: [:create]
  before_action :set_time_entry, only: [:edit, :update]

  def index
    @entries = current_user.time_entries
  end

  def create
    if !current_user.time_entries.last&.in_progress? || current_user.time_entries.last.nil?
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

  def update
    if @entry.update(
        start_at: parse_time(@entry, time_entry_params[:start_time]),
        end_at: parse_time(@entry, time_entry_params[:end_time])
    )
      redirect_to time_entries_path, success: 'Entry update successfuly'
    else
      flash[:error] = @entry.errors.full_messages
      render :edit
    end
  end

  private

  def set_date
    @date = Time.zone.now
  end

  def set_time_entry
    @entry = TimeEntry.find_by(id: params[:id], user: current_user)
  end

  def time_entry_params
    params.require(:time_entry).permit(:start_time, :end_time)
  end

  def parse_time(entry, time)
    Time.zone.parse("#{entry.day} #{time}").to_i
  end
end
