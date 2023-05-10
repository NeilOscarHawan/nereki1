class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:reservations, :reserve]
  def index
  
  end

  def reservations
  end

  def reserve 
  end

  def faq
    
  end
  
end
