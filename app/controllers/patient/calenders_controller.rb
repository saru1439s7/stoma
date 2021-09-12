class Patient::CalendersController < ApplicationController

  def index
    @calender = Calender.new
    @calenders = Calender.all
    #@edit_calender = Calender.find(params[:calender_id])
  end
  def create
    @calender = Calender.new(calender_params)
    @calender.patient_id = current_patient.id
    @calender.save
    @calenders= Calender.all
  end

  def update
    @calender = Calender.find(params[:id])
    @calenders = Calender.all
    @calender.update(calender_params)
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def destroy
    @clender = Clender.find(params[:id])
    @calender.destroy
    redirect_to patient_calenders_path,notice:"予定を削除しました"
  end

   def show
    #@calender = Calender.find(params[:id])
   end
   def new
     @calender = Calender.new
   end
  private
   def calender_params
     params.require(:calender).permit(:body,:title,:starts_at,:ends_at)
   end
end
