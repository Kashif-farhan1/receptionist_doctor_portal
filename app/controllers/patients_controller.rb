# class PatientsController < ApplicationController
#   before_action :authenticate_doctor!

#   def index
#     @patients = current_doctor.patients

#   end
# end
class PatientsController < ApplicationController
  before_action :authenticate_doctor!

  def index
    @patients = current_doctor.patients
  end

  # Define a new action to open an HTML page
  def show_other_page
    # Specify the path to the HTML file
    file_path = '/Users/mohammedkashiffarhan/Desktop/test/one.html'
    
    # Check if the file exists
    if File.exist?(file_path)
      # Send the file as a response
      send_file(file_path, disposition: 'inline')
    else
      # Handle the case when the file does not exist
      render plain: 'File not found', status: :not_found
    end
  end
end
