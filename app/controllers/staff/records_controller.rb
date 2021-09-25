class Staff::RecordsController < ApplicationController
  #医療stffのストマ記録
  before_action :authenticate_staff!

  def new
    @record = Record.new
    @patient = Patient.find(params[:patient_id])
    #render 'staff/patients/records/new'(早くできたら患者に紐付けたい)
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @record = Record.new(record_params)
    @record.patient_id = @patient.id

    return redirect_to staff_patient_record_path(@patient.id, @record) if @record.save
    render :new
    # if @record.save
    # redirect_to staff_patient_record_path(@patient,@record)
    # else
    # render :new
    # end
  #   raise  ActiveRecord::RecordInvalid
  #   flash.now[:alert] = @record.errors.full_message_for(:adjacent,:barrier,:circumscribing,:discolor)
    # render :new
    # (@patient_id, @record)(@record,@patient_id)
  end

  def edit
   @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    return redirect_to staff_patient_record_path(@record) if @record.update(record_params)
    render :edit
    # if @record.update(record_params)
    #   redirect_to staff_patient_record_path(@record)
    # else
    #   render :edit
    # end
  end

  def show
   @record = Record.find(params[:id])
  end

  def index
    @records = Record.where(patient_id: params[:patient_id]).page(params[:page]).per(7).reverse_order
  end

    private
     def record_params
       params.require(:record).permit(:patient_id,:adjacent,:barrier,:circumscribing,:discolor,:h_size,:w_size,:d_size,:comment,:image)
     end
end
