class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:myreservations, :reserve]
  def index
  
  end

  def myreservations
  end

  def reserve 
  end

  def faq
    
  end
  
end
