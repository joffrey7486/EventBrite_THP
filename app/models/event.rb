class Event < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}

  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal: 1000 }
  
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validate :is_five_multiplier

  validates :start_date, presence: true
  validate :end_after_start
  
  validates :location, presence: true 

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  private

  def end_after_start
    begin
      errors.add(:start_date, "L'évènement ne peut pas avoir déjà eu lieu") if start_date < Time.now
    rescue => exception
      return
    end
  end

  def is_five_multiplier
    return if duration.blank?
    errors.add(:duration, "must be a 5 multiplier") unless duration % 5 == 0
  end

end
