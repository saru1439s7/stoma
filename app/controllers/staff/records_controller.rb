class Staff::RecordsController < ApplicationController
  #医療stffのストマ記録
  def new
    @record = Record.new
    @patient = Patient.find(params[:patient_id])
    # render 'staff/patients/records/new'
  end

  def create
    patient = Patient.find(params[:id])
    record = current_staff.record.new(record_params)
    record.patient_id = patient.id
    record.save
    redirect_to record_path(record)
  end

  def edit
   record.find(id: params[:id], record_id: params[:record_id])
  end

  def update
  end

  def show
  end

  def index
  end

private
 def record_params
   params.require(:record).permit(:patient_id,:adjacent,:barrier,:circumscribing,:discolor,:h_size,:w_size,:comment,:image)
 end
end
