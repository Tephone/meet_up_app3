class Students::LessonsController < ApplicationController
  def show
    @lessons = current_student.lessons.after_current
  end
end
