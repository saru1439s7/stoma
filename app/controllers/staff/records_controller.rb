class Staff::RecordsController < ApplicationController
  #医療stffのストマ記録
  def new
    @record = Record.new
    @patient = Patient.find(params[:patient_id])
    #render 'staff/patients/records/new'(早くできたら患者に紐付けたい)
  end

  def create
    #@patient = Patient.find(params[:patient_id])
    #@record = Record.new(record_params)
    #@record.staff_id = staff.id
    #@record.patient_id = patient.id
    #@record.save
    #redirect_to staff_patient_record_path(@record)

    @patient = Patient.find(params[:patient_id])
    @record = Record.new(record_params)
    @record.patient_id = @patient.id
    @record.save!
    redirect_to staff_patient_record_path(@record,@patient)


  end

  def edit
   #@patient = Patient.find(params[:patient_id])
   @record = Record.find(params[:id])
   #@record = Record.find_by(id: params[:id], patient_id: params[:patient_id])
  end

  def update
    @record = Record.find(params[:id])
    #@record = Record.find_by(id: params[:id], record_id: params[:record_id])
    if @record.update(record_params)
      redirect_to staff_patient_record_path(@record)
    else
      render :edit
    end
  end

  def show
   #@record = Record.find_by(patient_id: params[:patient_id],id: params[:record_id])
   @record = Record.find(params[:id])
  end

  def index
    @records = Records.all
  end

private
 def record_params
   params.require(:record).permit(:patient_id,:adjacent,:barrier,:circumscribing,:discolor,:h_size,:w_size,:comment,:image)
 end
end
