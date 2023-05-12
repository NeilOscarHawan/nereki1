json.extract! reservation, :id, :res_name, :res_type, :contact_num, :res_date, :res_time, :sched_days, :avr, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
