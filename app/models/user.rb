class User < ApplicationRecord
  after_create :welcome_send

  has_many :events, foreign_key: 'admin_id', class_name: "Event" 
  has_many :attendances
  has_many :events, through: :attendances

  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
    uniqueness: true
    
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
