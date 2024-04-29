# class ReceptionistsRegistrationController < ApplicationController
#   def new
#   end

#   def create
#   end
# end
class ReceptionistsRegistrationController < ApplicationController
  def new
    @receptionist = Receptionist.new
  end

  def create
    @receptionist = Receptionist.new(receptionist_params)
    if @receptionist.save
      flash[:success] = "Receptionist registered successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def receptionist_params
    params.require(:receptionist).permit(:name, :email, :password, :password_confirmation)
  end
end

