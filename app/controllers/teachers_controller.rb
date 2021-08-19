class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.page(params[:page])
  end

  def new
    @teacher = Teacher.new
  end

  def create 
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_path, notice: '講師を作成しました'
    else
      render :new
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def destroy
    teacher = Teacher.find(params[:id])
    if admin_signed_in?
      teacher.destroy!
      redirect_to admin_path, notice: '講師を削除しました'
    else
      redirect_to top_path, alert: '講師の削除は管理者しかできません'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit %i[ name email language_id profile image password password_confirmation]
  end
end
