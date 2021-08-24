module TeacherReservationRatesHelper
  def reservation_rate_for_month(teacher, today)
    lessons_for_month = teacher.lessons.where(started_at: today.in_time_zone.all_month)
    reserved_lessons_for_month = lessons_for_month.select{|lesson| lesson.lesson_reservation.present?}
    if lessons_for_month.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons_for_month.count / lessons_for_month.count.to_f * 100
      reservation_rate.to_i
    end
  end

  def reservation_rate_for_day(teacher, date)
    lessons_for_day = teacher.lessons.where(started_at: date.in_time_zone.all_day)
    reserved_lessons = lessons_for_day.select{|lesson| lesson.lesson_reservation.present?}
    if lessons_for_day.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons.count / lessons_for_day.count.to_f * 100
      reservation_rate.to_i
    end
  end
end
