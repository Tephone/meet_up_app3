class Students::PastLessonsController < ApplicationController
  def show
    @student = Student.find(params[:student])
    @lessons = @student.lessons.past.page(params[:page])
  end
end
