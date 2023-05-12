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


end
