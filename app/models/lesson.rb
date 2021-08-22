class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation, dependent: :destroy
  validates :started_at, presence: true
  validate :started_at_should_be_after_current

  scope :after_current, -> { where('started_at >= ?', Time.current) }
  scope :past, -> {where('started_at <= ?', Time.current)}
  scope :reserved, -> {where(id: LessonReservation.select(:lesson_id))}
  scope :not_reserved, -> { where.not(id: LessonReservation.select(:lesson_id)) }
  scope :search_by_teacher_name, ->(teacher_name) { where('teachers.name LIKE ?', "%#{teacher_name}%") }
  scope :search_by_language_name, ->(language_id) { where('languages.id::text LIKE ?', language_id) }
  scope :search_by_date, ->(date) { where(started_at: date.in_time_zone.all_day) }

  def started_at_should_be_after_current
    errors.add(:started_at, 'は現在以降の日時を設定してください') if self.started_at&.past?
  end
end
