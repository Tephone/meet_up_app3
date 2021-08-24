module LanguageReservationRatesHelper
  def language_reservation_rate_for_month(language, today)
    lessons_for_month = Lesson.for_month(today).where(teacher_id: language.teachers)

    reserved_lessons = lessons_for_month.select{ |lesson| lesson.lesson_reservation.present?}
    if lessons_for_month.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons.count / lessons_for_month.count.to_f * 100
      reservation_rate.to_i
    end
  end

  def language_reservation_reate_for_day(language, date)
    lessons_for_day = Lesson.where(started_at: date.in_time_zone.all_day).where(teacher_id: language.teachers)
    reserved_lessons = lessons_for_day.select{ |lesson| lesson.lesson_reservation.present?}
    if lessons_for_day.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons.count / lessons_for_day.count.to_f * 100
      reservation_rate.to_i
    end
  end
end
