class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchase_tickets, dependent: :destroy
  has_many :tickets, through: :purchase_tickets, source: :ticket
  has_many :purchase_tickets_within_deadline, -> { where(deadline: Date.current..) }, class_name: 'PurchaseTicket'
  has_many :valid_tickets, through: :purchase_tickets_within_deadline, source: :ticket
  has_many :lesson_reservations, dependent: :destroy
  has_many :lessons, through: :lesson_reservations, source: :lesson
  has_one :choice_monthly_plan

  def remaining_lesson_count
    self_lesson_count = self.valid_tickets.sum(:lesson_count)
    self_reservations = self.lesson_reservations
    self_lesson_count - self_reservations.count
  end
end
