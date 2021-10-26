class Staff::OstomiesController < ApplicationController
   #医療スタッフは、患者さんが書いたストーマの記録を見てコメントしてサポートする。/基本、記録は消さないためdestroyはなし
   #主体性を大事にしたいことと、また患者さんのものなのでedit機能はなしとした
  before_action :authenticate_staff!

  def index #患者さんごとのindex
    @ostomies = Ostomy.where(patient_id: params[:patient_id]).page(params[:page]).per(7).reverse_order
  end

  def show #showページでコメントを作る
    @comment = Comment.new
    @ostomy = Ostomy.find(params[:ostomy_id])
  end

  def create
    @ostomy = Ostomy.find(params[:ostomy_id])
    @comment = current_staff.comment.new(comment_params)
    @comment.ostomy_id = ostomy.id
    return redirect_to staff_ostomy_path(@ostomy) if @comment.save
    render :show
  end

  private
    def ostomy_params
     params.require(:ostomy).permit(:color,:edema,:skin,:h_size,:w_size,:comment,:image)
    end

end
