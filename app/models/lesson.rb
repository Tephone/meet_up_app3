class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation, dependent: :destroy
  validates :started_at, presence: true
  validate :started_at_should_be_after_current

  scope :after_current, -> { where('started_at >= ?', Time.current) }
  scope :not_reserved, -> { where.not(id: LessonReservation.select(:lesson_id)) }

  def started_at_should_be_after_current
    errors.add(:started_at, 'は現在以降の日時を設定してください') if self.started_at&.past?
  end
end
