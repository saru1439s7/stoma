class Patient::DialiesController < ApplicationController

  def index
    @dialies = Dialy.all
  end

  def new
    @dialy = Dialy.new
  end

  def edit
    @dialy = Dialy.find(params[:id])
  end

  def create
    @dialy = Dialy.new(dialy_params)
    @dialy.patient_id = current_patient.id
   if @dialy.save
     redirect_to patient_dialy_path(@dialy)
   else
     render :new
   end
  end


  def update
    @dialy = Dialy.find(params[:id])
   if @dialy.update(dialy_params)
     redirect_to patient_dialy_path(@dialy)
   else
     render :edit
   end
  end

  def show
    @dialy = Dialy.find(params[:id])
  end

  def dialy_params
    params.require(:dialy).permit(:weight,:systolic_bp,:diastolic_bp,:bt,:bs,:color,:feeling,:comment,:image)
  end
end
