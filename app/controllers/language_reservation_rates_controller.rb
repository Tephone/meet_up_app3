class LanguageReservationRatesController < ApplicationController
  def show
    @language = Language.find(params[:language])
    @today = Date.current
    @from = @today.beginning_of_month
    @to = @today.end_of_month
    @dates_in_month = @from.upto(@to)
    @dates_for_week = @dates_in_month.slice_before{|date| date.wday.zero?}.to_a
    @days = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日].freeze
  end
end
