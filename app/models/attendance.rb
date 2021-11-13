class Attendance < ApplicationRecord
  after_create :attendance_email
  
  validates :stripe_customer_id, presence: true, uniqueness: true
  belongs_to :user, class_name: "User"
  belongs_to :event, class_name: "Event"


  def attendance_email
    UserMailer.attendance_email(self).deliver_now
  end
end
