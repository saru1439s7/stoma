class Staff::DialiesController < ApplicationController
  #医療スタッフが患者さんが書いた記録をみれてコメントする
  def index
    @dialies = Dialy.all
  end
  def show
    @dialy = Dialy.find(params[:id])
  end

  private
  def dialy_params
    params.require(:dialy).permit(:weight,:systolic_bp,:diastolic_bp,:bt,:bs,:color,:feeling,:comment,:image)
  end

end
