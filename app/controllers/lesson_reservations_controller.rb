class LessonReservationsController < ApplicationController
  def create
    if current_student.remaining_lesson_count <= 0
      redirect_to lessons_path, alert: 'チケットを購入してください'
    else
      lesson_reservation = current_student.lesson_reservations.new(lesson_id: params[:lesson_reservation][:lesson_id])
      lesson_reservation.save!
      NoticeMailer.reservation_notice_to_student(lesson_reservation).deliver_now
      NoticeMailer.reservation_notice_to_teacher(lesson_reservation).deliver_now
      redirect_to students_lesson_path, notice: 'レッスンを予約しました'
    end
  end

  def destroy
    lesson_reservation = current_student.lesson_reservations.find(params[:id])
    lesson_reservation.destroy!
    redirect_to lessons_path, notice: 'レッスン予約を解除しました'
  end
end
