class Patient::DialiesController < ApplicationController
  #患者の健康記録(体調や血圧など)/基本、記録は消さないためdestroyはなし
 before_action :authenticate_patient!
  def index
    @dialies = current_patient.dialies.all.page(params[:page]).per(7).reverse_order
     #Dialy.where( parient.id: current_patient.id)#全体の中から絞って持ってくる
  end

  def show
    @dialy = Dialy.find(params[:id])
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
    @dialy.score = Language.get_data(dialy_params[:comment])
    # binding.irb#get_dataわかりづらい
    # texts = Vision.get_image_data(@dialy.image)
    # texts.each do |text|
    # @dialy.texts.create(name: text)
    # end

    return redirect_to patient_dialy_path(@dialy) if @dialy.save
    render :new
  # if @dialy.save
  #   redirect_to patient_dialy_path(@dialy)
  # else
  #   render :new
  # end
  end


  def update
    @dialy = Dialy.find(params[:id])
    return redirect_to patient_dialy_path(@dialy) if @dialy.update(dialy_params)
    render :edit
    # if @dialy.update(dialy_params)
    #   redirect_to patient_dialy_path(@dialy)
    # else
    #   render :edit
    # end
  end

 private
  def dialy_params
    params.require(:dialy).permit(:weight,:systolic_bp,:diastolic_bp,:bt,:bs,:color,:feeling,:comment,:image,:patient_id)
  end
end
