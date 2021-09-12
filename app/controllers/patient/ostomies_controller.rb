class Patient::OstomiesController < ApplicationController

  def new
     @ostomy = Ostomy.new
  end

  def show
    @ostomy = Ostomy.find(params[:id])
  end

  def index
    @ostomies= Ostomy.all
  end

  def edit
    @ostomy = Ostomy.find(params[:id])
  end

  def create
     @ostomy = Ostomy.new(ostomy_params)
     @ostomy.patient_id = current_patient.id
     if @ostomy.save
       redirect_to patient_ostomy_path(@ostomy)
     else
       render :new
     end
  end

  def update
    @ostomy = Ostomy.find(params[:id])
    if @ostomy.update(ostomy_params)
      redirect_to patient_ostomy_path(@ostomy)
    else
      render :edit
    end
  end

  private
    def ostomy_params
     params.require(:ostomy).permit(:color,:edema,:skin,:h_size,:w_size,:comment,:image,:patient_id)
    end
end