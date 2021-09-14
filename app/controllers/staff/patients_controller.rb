class Staff::PatientsController < ApplicationController
  #医療staffの患者一覧
  before_action :authenticate_staff!
  def index
   @patients = Patient.all.page(params[:page]).per(7).reverse_order
  end

  def show
    @patient = Patient.find(patient.id)
    @record = Record.new
  end

  def edit
    @patient = Patient.find(patient.id)
  end

  def update
   @patient = Patient.find(patient.id)
   if @patient.update(patient_params)
     redirect_to patient_path(current_patient)
   else
     render :edit
   end
  end

  private
   def patient_params
    params.require(:patient).permit(:name,:name_kana,:image,:email)
   end
end
