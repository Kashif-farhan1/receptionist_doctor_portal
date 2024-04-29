# class Doctors::SessionsController < ApplicationController
# end
# app/controllers/doctors/sessions_controller.rb
class Doctors::SessionsController < ApplicationController
    def create
      doctor = Doctor.find_by(email: params[:email])
      if doctor && doctor.authenticate(params[:password])
        session[:doctor_id] = doctor.id
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
  