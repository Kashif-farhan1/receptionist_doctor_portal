class ReceptionistsController < ApplicationController
  def new
    @receptionists = Receptionists.new
  end

  def create
    @receptionists = Receptionists.new(receptionist_params)
    if @receptionists.save
      # Redirect to login page or dashboard
    else
      render :new
    end
  end

  private

  def receptionist_params
    params.require(:receptionists).permit(:name, :email, :password, :password_confirmation)
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
