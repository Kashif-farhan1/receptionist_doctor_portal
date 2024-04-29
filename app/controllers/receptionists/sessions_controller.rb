# class Receptionists::SessionsController < ApplicationController
# end
# app/controllers/receptionists/sessions_controller.rb
class Receptionists::SessionsController < ApplicationController
    def create
      receptionist = Receptionist.find_by(email: params[:email])
      if receptionist && receptionist.authenticate(params[:password])
        session[:receptionist_id] = receptionist.id
        redirect_to root_path, notice: "Logged in successfully"
      else
        flash.now[:alert] = "Invalid email or password"
        render :new
      end
    end
    def destroy
      session[:receptionist_id] = nil
      redirect_to root_path, notice: "Logged out successfully"
    end
  end
  