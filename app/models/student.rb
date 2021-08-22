class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchase_tickets, dependent: :destroy
  has_many :tickets, through: :purchase_tickets, source: :ticket
  has_many :lesson_reservations, dependent: :destroy
  has_many :lessons, through: :lesson_reservations, source: :lesson

  def remaining_lesson_count
    self_lesson_count = self.tickets.sum(:lesson_count)
    self_reservations = self.lesson_reservations
    self_lesson_count - self_reservations.count
  end
end
