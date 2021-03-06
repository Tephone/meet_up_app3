# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def sign_in_as_teachers
    if admin_signed_in?
      @teacher = Teacher.find(params[:teacher])
      sign_in @teacher
      redirect_to teacher_path(@teacher), notice: '代理ログインしました'
    else
      redirect_to top_path, alert: '代理ログインは管理者しかできません'
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    admin_path
  end
end
