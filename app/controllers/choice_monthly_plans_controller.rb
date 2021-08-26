class ChoiceMonthlyPlansController < ApplicationController
  before_action :set_choice_monthly_plan, only: %i[show edit update destroy]

  def new
    @choice_monthly_plan = current_student.build_choice_monthly_plan
  end

  def create
    @choice_monthly_plan = current_student.build_choice_monthly_plan(choice_monthly_plan_params)
    if @choice_monthly_plan.save
      current_student.purchase_tickets.create!(ticket_id: @choice_monthly_plan.monthly_plan.ticket.id, deadline: Date.current.end_of_month)
      redirect_to student_path(current_student), notice: 'プランを選択しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @choice_monthly_plan.update(choice_monthly_plan_params)
      redirect_to student_path(current_student), notice: 'プランを変更しました'
    else
      render :edit
    end
  end

  def destroy
    @choice_monthly_plan.destroy!
    redirect_to student_path(current_student), notice: 'プランを休止しました'
  end

  private

  def choice_monthly_plan_params
    params.require(:choice_monthly_plan).permit %i[monthly_plan_id student_id]
  end

  def set_choice_monthly_plan
    @choice_monthly_plan = current_student.choice_monthly_plan
  end
end
