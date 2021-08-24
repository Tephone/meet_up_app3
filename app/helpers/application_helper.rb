module ApplicationHelper
  def languages_option
    Language.all.map { |language| [t("language.#{language.name}"), language.id] }
  end

  def time_reservation_rate(date)
    lessons_for_time = Lesson.where('? <= started_at AND started_at <= ?', date.in_time_zone.beginning_of_hour, date.in_time_zone.end_of_hour)
    reserved_lessons = lessons_for_time.reserved
    reserved_lessons = lessons_for_time.select { |lesson| lesson.lesson_reservation.present? }

    if lessons_for_time.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons.count / lessons_for_time.count.to_f * 100
      reservation_rate.to_i
    end
  end
end
