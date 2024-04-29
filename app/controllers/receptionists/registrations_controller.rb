# class Receptionists::RegistrationsController < ApplicationController
#   def new
#   end

#   def create
#   end
# end
# app/controllers/receptionists/registrations_controller.rb

class Receptionists::RegistrationsController < ApplicationController
  def new
    @receptionist = Receptionist.new
  end
  private
  def receptionist_params
    params.require(:receptionist).permit(:email, :password, :password_confirmation)
  end

  def create
    @receptionist = Receptionist.new(receptionist_params)
    if @receptionist.save
      redirect_to receptionists_dashboard_path, notice: 'Receptionist account was successfully created.'
    else
      flash.now[:error] = 'Failed to create receptionist account.'
      render 'new'
    end
  end

  


end

