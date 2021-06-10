class TimeEntriesController < ApplicationController
  def index
    @entries = current_user.time_entries
  end
end
