# class Doctors::PatientsController < ApplicationController
# end
# app/controllers/doctors/patients_controller.rb
class Doctors::PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
    def index
      @patients = current_doctor.patients # Assuming there's a many-to-many association between Doctor and Patient

    end
  
    def show
    end
  
    def new
      @patient = Patient.new
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to doctors_patient_path(@patient), notice: 'Patient was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @patient.update(patient_params)
        redirect_to doctors_patient_path(@patient), notice: 'Patient was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @patient.destroy
      redirect_to doctors_patients_path, notice: 'Patient was successfully destroyed.'
    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
  
    def patient_params
      params.require(:patient).permit(:name, :age)
    end
    def graph
        # Retrieve patient data and group by registration date
        patient_data = Patient.group("DATE(created_at)").count
        
        # Extract dates and counts from patient data
        @dates = Patient.pluck(:created_at).map { |date| date.strftime('%Y-%m-%d') }.uniq
        @patient_counts = @dates.map { |date| Patient.where("DATE(created_at) = ?", date).count }
      end
  end
  