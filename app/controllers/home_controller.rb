class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:myreservations, :reserve]
  def index
    start_date = params.fetch(:start_date, Date.today).to_date

    @reservations = Reservation.where(res_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def myreservations
  end

  def reserve 
  end

  def faq
    
  end
  
end
