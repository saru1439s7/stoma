class Staff::PatientsController < ApplicationController
  #医療staffの患者一覧
  before_action :authenticate_staff!
  before_action :set_q, only: [:index, :search]

  def index 
   @patients = Patient.all.page(params[:page]).per(7).reverse_order
  end

  def show
    @patient = Patient.find(params[:id])
    @record = Record.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
   @patient = Patient.find(params[:id])
   if @patient.update(patient_params)
     redirect_to staff_patient_path(@patient.id)
   else
     render :edit
   end
  end

  def search
    # @q = Patients.ransack(params[:q])
    # @patients = @q.result(distinct: true)

     @results = @q.result
    # @patients = Patient.all.page(params[:page]).per(7).reverse_order
  end

  private
   def set_q
    @q = Patient.ransack(params[:q])
   end

   def patient_params
    params.require(:patient).permit(:name,:name_kana,:image,:email)
   end
end
