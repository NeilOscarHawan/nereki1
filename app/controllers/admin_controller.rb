class AdminController < ApplicationController
    layout 'admin'

    before_action:authenticate_user!

    
    def index
      if current_user.email.end_with?('@admin.com')
        admin_index_path
       else
        redirect_to root_path
       end
      render :index
    end

    def pending
      @reservations = Reservation.all
      if current_user.email.end_with?('@admin.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end

    def faq
      if current_user.email.end_with?('@admin.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end

    def admin
      if current_user.email.end_with?('@admin.com')
           admin_index_path
          else
           redirect_to root_path
          end
    end

    def approved
      if current_user.email.end_with?('@admin.com')
        admin_index_path
       else
        redirect_to root_path
       end
    end
    
    def after_sign_in_path_for(resource)
        if current_user.email.end_with?('@admin.com')
           admin_index_path
          else
           redirect_to root_path
          end
      end
    
end


