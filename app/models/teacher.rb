class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :lessons, dependent: :destroy
  belongs_to :language
end
