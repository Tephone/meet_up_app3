class ChoiceMonthlyPlan < ApplicationRecord
  belongs_to :monthly_plan
  belongs_to :student

  def self.ticket_subscription
    self.all.find_each do |plan|
      plan.student.purchase_tickets.create(ticket_id: plan.monthly_plan.ticket.id, deadline: Date.current.end_of_month)
    end
  end
end
