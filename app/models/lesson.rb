class Lesson < ApplicationRecord
  belongs_to :teacher
  validates :started_at, presence: true

  scope :after_current, -> { where('started_at >= ?', Time.current) }
end
