module TimeEntryHelper
  def end_time_helper(entry)
    entry.in_progress? ? '' : entry.end_time
  end

  def duration_helper(entry)
    entry.in_progress? ? '' : entry.duration
  end

  def edit_link_helper(entry)
    return '' if entry.in_progress?

    link_to 'Edit this entry', edit_time_entry_path(entry)
  end
end
