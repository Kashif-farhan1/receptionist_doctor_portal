class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      # Redirect to login page or dashboard
    else
      render :new
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :email, :password, :password_confirmation)
  end
    before_action :authenticate_user

    def index
      @patients = current_user.patients
    end
  
    private
  
    def authenticate_user
      unless current_user
        redirect_to login_path, alert: "Please log in to view this page."
      end
    end
end
