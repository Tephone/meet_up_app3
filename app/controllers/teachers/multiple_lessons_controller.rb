class Teachers::MultipleLessonsController < Teachers::ApplicationController
  def new
  end

  def create
    started_at_ary = params[:multiple_lessons][:started_at].without("")
    if started_at_ary.count.zero?
      render :new
    else
      started_at_ary.each do |started_at|
        current_teacher.lessons.create!(started_at: started_at)  if started_at.present?
      end
      redirect_to teachers_lesson_path, notice: 'レッスンを複数作成しました'
    end
  end
end
