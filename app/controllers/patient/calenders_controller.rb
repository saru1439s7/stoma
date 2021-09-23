class Patient::CalendersController < ApplicationController
  #患者さんが予定を管理できる
 before_action :authenticate_patient!
 
  def index
    @calender = Calender.new
    @calenders = Calender.all
  end
  
  def create
    @calender = Calender.new(calender_params)
    @calender.patient_id = current_patient.id
    @calender.save!
    @calenders= Calender.all
    redirect_to patient_calenders_path
  end

  def update
    @calender = Calender.find(params[:id])
    @calenders = Calender.all
    @calender.update(calender_params)
    redirect_to patient_calenders_path
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def destroy #jsリクエストでくる
    @calender = Calender.find(params[:id])
    @calender.destroy
    #js.erb <
    #html.erb
    #redirect_to patient_calenders_path
  end
  
  def new
    @calender = Calender.new
  end
  
  #モーダルで表示するためなしとした
  # def show
  # 　#@calender = Calender.find(params[:id])
  # end
   
  
  private
   def calender_params
     params.require(:calender).permit(:body,:title,:starts_at,:ends_at)
   end
end
