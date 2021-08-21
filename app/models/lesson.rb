class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation
  validates :started_at, presence: true

  scope :after_current, -> { where('started_at >= ?', Time.current) }
  scope :not_reserved, -> { where.not(id: LessonReservation.select(:lesson_id)) }
end
