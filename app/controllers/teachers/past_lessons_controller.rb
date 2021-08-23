class Teachers::PastLessonsController < Teachers::ApplicationController
  def show
    @lessons = current_teacher.lessons.past.reserved.page(params[:page])
  end
end
