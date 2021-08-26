class AddColumnToPurchaseTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_tickets, :deadline, :date, null: false, default: Date.current.since(1000.years)
  end
end
