# class Doctors::RegistrationsController < ApplicationController
#   def new
#   end

#   def create
#   end
# end
# app/controllers/doctors/registrations_controller.rb

class Doctors::RegistrationsController < ApplicationController
  def new
    @doctor = Doctor.new
  end
  private

  def doctor_params
    params.require(:doctor).permit(:email, :password, :password_confirmation)
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_dashboard_path, notice: 'Doctor account was successfully created.'
      flash[:success] = "Doctor account created successfully!"
      redirect_to root_path
    else
      flash.now[:error] = "Failed to create doctor account"
      render 'new'
    end
  end

 
end
