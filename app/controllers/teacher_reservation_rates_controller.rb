class TeacherReservationRatesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @teacher = Teacher.find(params[:teacher])
    @today = Date.current
    @from = @today.beginning_of_month
    @to = @today.end_of_month
    @dates_in_month = @from.upto(@to)
    @dates_for_week = @from.upto(@to).slice_before { |date| date.wday.zero? }.to_a
    @days = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日].freeze
  end
end
