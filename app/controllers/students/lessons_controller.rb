class Students::LessonsController < Students::ApplicationController
  def show
    @lessons = current_student.lessons.after_current
  end
end
