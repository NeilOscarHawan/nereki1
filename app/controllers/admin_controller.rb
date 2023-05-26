class AdminController < ApplicationController
    layout 'admin'

    before_action:authenticate_user!

    
    def index
 @reservations = Reservation.all
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
        redirect_to root_path
       else
        redirect_to root_path
       end

    end
    

    def pending
      @reservations = Reservation.all
  
    end

    def faq
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end

    def admin
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
           admin_index_path
          else
           redirect_to root_path
          end
    end

    def approved
      @reservations = Reservation.all
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end

    def avr
      @users = User.all
      @avrs = Avr.all
      @reservations = Reservation.all
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end
    
    def after_sign_in_path_for(resource)
      if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
           admin_index_path
          else
           redirect_to root_path
          end
      end
    
end


