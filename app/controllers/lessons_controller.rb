class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[edit update destroy]
  
  def index
    @lessons = Lesson.not_reserved.after_current.page(params[:id])
    if params[:teacher_name].present?
      @lessons = @lessons.joins(:teacher).search_by_teacher_name(params[:teacher_name]).page(params[:id])
    end

    if params[:language_id].present?
      @lessons = @lessons.joins(teacher: :language).search_by_language_name(params[:language_id]).page(params[:id])
    end

    if params[:date].present?
      @lessons = @lessons.search_by_date(params[:date]).page(params[:id])
    end
  end

  def new
    @lesson = current_teacher.lessons.new
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    if @lesson.save
      redirect_to teachers_lesson_path, notice: 'レッスンを作成しました'
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson), notice: 'レッスンを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy!
    redirect_to teachers_lesson_path, notice: 'レッスンを削除しました'
  end

  private

  def lesson_params
    params.require(:lesson).permit %i[started_at content zoom_url teacher_id]
  end

  def set_lesson
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
