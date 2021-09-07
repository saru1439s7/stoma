class Patient::CalendersController < ApplicationController

  def new
    @calender = Calender.new
  end

  def create
    @calender = Calender.new(calender_params)
    @calender.patient_id = current_patient.id
    @calender.save
    #jsの時は↓入れると読み込まれなくなる
    # if @calender.save
    #   redirect_to patient_calenders_path
    # else
    #   render :index
    # end
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update
      redirect_to patient_calenders_path
    else
      render :edit
    end
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def destroy
    @clender = Clender.find(params[:id])
    @calender.destroy
    redirect_to patient_calenders_path,notice:"予定を削除しました"
  end

  def index
    @calenders = Calender.all
    @calender = Calender.new
  end

  def show
     @clander = Calender.find(params[:id])
  end

  private
   def calender_params
     params.require(:calender).permit(:body,:title,:starts_at,:ends_at)
   end
end
