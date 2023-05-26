class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

         has_many :reservation
         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.full_name = auth.info.name # assuming the user model has a name
            
            # If you are using confirmable and the provider(s) you use validate emails,
            # uncomment the line below to skip the confirmation emails.
            # user.skip_confirmation!
          end
        end
        def role
        if self.email.end_with?("@my.xu.edu.ph")
          "Student"
        elsif self.email.end_with?("@xu.edu.ph")
          "Teacher"
        elsif self.email.end_with?("@admin.com")
          "Admin"
        elsif self.email.end_with?("@staff.com")
          "Staff"
        end
      end    
    end
      

