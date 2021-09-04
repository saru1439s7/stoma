class Patient::OstomiesController < ApplicationController
  
  def new
     @ostomy = Ostomy.new(ostomy_params)
  end

  def careate
     @ostomy = Ostomy.new(ostomy_params)
     @ostomy.patient_id = current_patient.id
     if @ostomy.save
       redirect_to ostomy_path(current_ostomy)
     else
       render :new
     end
  end

  def show
    @ostomy = Ostomy.find(params[:id])
  end

  def index
    @ostomies.all
  end

  def edit
    @ostomy = Ostomy.find(params[:id])
  end

  def update
    @ostomy = Ostomy.find(params[:id])
    if @ostomy.update(ostomy_params)
      redirect_to ostomy_path
    else
      render :edit
    end
  end

  private
    def ostomy_params
     params.require(:ostomy).permit.(:color,:edema,:skin,:h_size,:w_size,:comment,:image)
    end
end