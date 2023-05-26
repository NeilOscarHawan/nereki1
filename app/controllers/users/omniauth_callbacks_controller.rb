# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def google_oauth2
    user = User.from_omniauth(auth)

    if user.present? && user.email.end_with?("@my.xu.edu.ph") || user.email.end_with?("@xu.edu.ph") || user.email.end_with?("@admin.com") || user.email.end_with?("@staff.com")
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: "Login using XU Email Accounts, Staff, or Admin credentials only" }
      format.json { head :no_content }

    end
  end
end
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  private
  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
