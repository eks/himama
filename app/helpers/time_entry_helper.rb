module TimeEntryHelper
  def end_time_helper(entry)
    entry.in_progress? ? '' : entry.end_time
  end

  def duration_helper(entry)
    entry.in_progress? ? '' : entry.duration
  end
end
