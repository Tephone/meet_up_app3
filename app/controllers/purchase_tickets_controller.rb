class PurchaseTicketsController < ApplicationController
  def new
    @purchase_ticket = current_student.purchase_tickets.new
  end

  def create
    @purchase_ticket = current_student.purchase_tickets.new(ticket_id: params[:purchase_ticket][:ticket_id])
    if @purchase_ticket.save
      redirect_to student_path(current_student), notice: 'チケットを購入しました'
    else
      render :new
    end
  end
end
