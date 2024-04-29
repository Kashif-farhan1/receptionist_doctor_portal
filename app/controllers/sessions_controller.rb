# class SessionsController < ApplicationController
# end
class SessionsController < ApplicationController
    def create
      receptionist = Receptionist.find_by(email: params[:email])
      # user = User.find_by(email: params[:email])
      def new
        @devise_mapping = request.env["devise.mapping"]
        
      end
    
      
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
      end

      if receptionist && receptionist.authenticate(params[:password])
        session[:receptionist_id] = receptionist.id
        if receptionist.receptionist?
          redirect_to receptionists_dashboard_path
        elsif receptionist.doctor?
          redirect_to doctors_dashboard_path
        end
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end


      end
  
end