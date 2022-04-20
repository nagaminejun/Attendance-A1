module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(started_at, finished_at, next_day)
    if next_day == "1"
      format("%.2f", (((finished_at - started_at) / 60) / 60.0) +24)
    else
      format("%.2f", (((finished_at - started_at) / 60) / 60.0))
    end
  end
  
  def working_overtime(scheduled_end_time, designated_work_end_time, next_day)
    if  next_day == "1"
      format("%.2f", (((scheduled_end_time - designated_work_end_time) / 60) / 60.0) +24)
    else
      format("%.2f", ((scheduled_end_time - designated_work_end_time) / 60) / 60.0)
    end
  end
  
  def superiors(over_request_superior)
    if over_request_superior == 2
      User.find(2)
    elsif over_request_superior == 3
      User.find(3)
    end
  end
  
end