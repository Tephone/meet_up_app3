class Teachers::LessonsController < Teachers::ApplicationController
  def show
    @lessons = current_teacher.lessons.after_current.page(params[:page])
  end
end
