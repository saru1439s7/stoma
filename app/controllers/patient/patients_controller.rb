class Patient::PatientsController < ApplicationController
   # before_action :authenticate_patient!
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
   if @patient.update(patient_params)
    redirect_to patient_path(current_patient) , notice: "更新しました"
   else
    render 'edit'
   end
  end

 private
 def patient_params
   require(:patient).permit.(:name,:name_kana,:email,:image_id,:password)
 end
end
