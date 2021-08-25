class Students::PastLessonsController < Students::ApplicationController
  skip_before_action :authenticate_student!, if: :teacher_signed_in?

  def show
    @student = Student.find(params[:student])
    @lessons = @student.lessons.past.page(params[:page])
  end
end
