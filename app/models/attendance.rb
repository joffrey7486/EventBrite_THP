class Attendance < ApplicationRecord
    validates :stripe_customer_id, presence: true, uniqueness: true
    belongs_to :user
    belongs_to :event
end
