class Staff::RecordsController < ApplicationController
  #医療stffのストマ記録
  before_action :authenticate_staff!

  def new
    @record = Record.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @record = Record.new(record_params)
    @record.patient_id = @patient.id
    return redirect_to staff_patient_record_path(@patient.id, @record) if @record.save
    render :new
  end

  def edit
   @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    return redirect_to staff_patient_record_path(@record) if @record.update(record_params)
    render :edit
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
