require 'date'
require 'chronic'
class Season < ActiveRecord::Base
  has_many :workdays

  def current_week_work_dates
    days = Array.new
    open_days.split(',').each do |day_num|
      days.append Date::DAYNAMES[day_num.to_i]
    end

    Chronic.parse("")
    work_dates = Array.new
    days.each do |day_name|
      work_dates.append Chronic.parse(" #{day_name}" )
    end
    work_dates.to_s
  end

  def number_of_open_weeks
    to_date.cweek - from_date.cweek
  end

  def open_weeks
    weeks = Hash.new
    week = from_date.cweek

    for i in 0..number_of_open_weeks
      cur_week = week + i
      weeks[cur_week] = work_dates_for_week(cur_week)
    end
    weeks
  end

  def open_weeks_with_days
    weeks = Hash.new
    week = from_date.cweek

    for i in 0..number_of_open_weeks
      cur_week = week + i
      weeks[cur_week] = Array.new
    end

    workdays.each do |day|
      weeks[day.date.cweek].append(day)
    end

    weeks
  end

  def work_dates_for_week(week_number)

    monday = Date.commercial(2013, week_number, 1)
    day_numbers = Array.new
    open_days.split(',').each do |day_num|
      day_numbers.append((day_num.to_i - 1))
    end

    work_dates = Array.new
    day_numbers.each do |d|
      work_dates.append(monday + d)
    end

    return work_dates
  end

  def init_workdays_for_season
    weeks = open_weeks()
    weeks.each do |k,v|
      v.each do |day|
        workday = Workday.new
        workday.date = day
        workday.season_id = id
        workday.save
      end

    end
  end

end
