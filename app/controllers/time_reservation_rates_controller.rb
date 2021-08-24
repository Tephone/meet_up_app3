class TimeReservationRatesController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @today = Date.current
    @from = @today.beginning_of_month
    @to = @today.end_of_month
    @dates_in_month = (@from..@to).to_a
    @times = (7..22).to_a.freeze
  end
end
