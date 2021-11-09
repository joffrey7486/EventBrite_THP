class Event < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal: 1000 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validate :is_five_multiplier
  validates :start_date, presence: true, format: { with: ^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$ }
  validates :location, presence: true 
  validate :end_after_start

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  private

  def end_after_start
    errors.add(:start_date, "L'évènement ne peut pas avoir déjà eu lieu") if start_date < Time.now
  end

  def is_five_multiplier
    return if duration.blank?
    errors.add(:duration, "must be a 5 multiplier") unless duration % 5 == 0
  end
end

^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$