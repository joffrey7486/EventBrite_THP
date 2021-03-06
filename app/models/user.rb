class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_one_attached :profile_picture
  has_many :events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  has_many :attendances, foreign_key: 'user_id', class_name: 'Attendance'

  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
    uniqueness: true

    def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
