class Reservation < ApplicationRecord
    serialize :rows, Array
    belongs_to :user
    validates :res_name, presence: true
    validates :res_type, presence: true
    validates :contact_num, presence: true
    validates :res_date, presence: true
    validates :res_time, presence: true
    validates :res_type, presence: true
    validates :avr, presence: true
    validates :sched_days, presence: true
    validates :res_status, presence: true
    validate :validate_unique_on_avr_time_date

  private

  def validate_unique_on_avr_time_date
    errors.add(:base, 'Reservation already exists with the same avr, date, and time combination') 
    if Reservation.exists?(avr: avr, res_date: res_date, res_time: res_time, res_status: res_status)
  end
end
