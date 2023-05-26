class UsersController < ApplicationController
    def index
        @users = User.all
      end
      def show
        @user = User.find(params[:id])
      end
      def edit
        @user = User.find(params[:id])
      end
      def new
        @user = User.new
      end
      def create
        @user = User.new(user_params)
        if @user.save!
          redirect_to @user
        else
          render 'new'
        end
      end
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        
            respond_to do |format|
              format.html { redirect_to users_url, notice: "User was successfully destroyed." }
              format.json { head :no_content }
        
        
            end
          end
private
      def user_params
        params.require(:user).permit(:email, :password, :full_name, :password_confirmation)
      end
end
