class Patient::PatientsController < ApplicationController
 #患者のマイページ
  before_action :authenticate_patient!,except: :top
   def top
   end
 
   def show
    @patient = current_patient
   end
 
   def edit
    @patient = current_patient
   end
 
   def update
     @patient = current_patient
     return redirect_to patient_patient_path(current_patient) if @patient.update(patient_params)
     render :edit
    # if @patient.update(patient_params)
    #  redirect_to  patient_patient_path(current_patient)
    # else
    #  render 'edit'
    # end
   end
 
   private
    def patient_params
      params.require(:patient).permit(:name,:name_kana,:email,:image_id,:password)
    end
end
