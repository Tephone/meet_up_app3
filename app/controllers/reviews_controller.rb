class ReviewsController < ApplicationController
  before_action :authenticate_teacher!, only: %i[new create destroy]

  def new
    @review = current_teacher.reviews.new(lesson_id: params[:lesson])
  end

  def create
    @review = current_teacher.reviews.new(review_params)
    if @review.save
      NoticeMailer.review_notice_to_student(@review).deliver_now
      redirect_to teachers_past_lesson_path, notice: 'レビューを作成しました'
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = current_teacher.reviews.find(params[:id])
    review.destroy!
    redirect_to teachers_past_lesson_path, notice: 'レビューを削除しました'
  end

  private

  def review_params
    params.require(:review).permit %i[lesson_id content]
  end
end
