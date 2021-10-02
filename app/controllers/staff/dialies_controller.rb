class Staff::DialiesController < ApplicationController
  #医療スタッフが患者さんが書いた記録をみれてコメントする
 before_action :authenticate_staff!

  def index
    @dialies = Dialy.all.page(params[:page]).per(7).reverse_order
  end

  def show
    @dialy = Dialy.find(params[:dialy_id])
    #ここ追加
    # @dialy.score = Language.get_data(dialy_params[:comment])
  end

  private
    def dialy_params
      params.require(:dialy).permit(:weight,:systolic_bp,:diastolic_bp,:bt,:bs,:color,:feeling,:comment,:image,:patient_id)
    end
end
