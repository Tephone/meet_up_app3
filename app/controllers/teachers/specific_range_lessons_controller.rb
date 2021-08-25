class Teachers::SpecificRangeLessonsController < Teachers::ApplicationController
  def new
  end

  def create
    date = params[:date].in_time_zone
    start_time = params[:start_time].to_i
    end_time = params[:end_time].to_i
    time_range = (start_time..end_time).to_a
    if !time_range.present? || !date.present?
      render :new
    else
      time_range.each do |time|
        started_at = date + time.hour
        current_teacher.lessons.create(started_at: started_at)
      end
      redirect_to teachers_lesson_path, notice: 'レッスンを範囲指定で作成しました'
    end
  end
end
