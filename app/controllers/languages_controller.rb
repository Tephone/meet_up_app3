class LanguagesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @languages = Language.all.page(params[:page])
  end
end
