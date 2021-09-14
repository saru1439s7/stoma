class Staff::OstomiesController < ApplicationController
   #医療スタッフが
   #患者さんが書いた記録を見てコメントする
 before_action :authenticate_staff!
  def index #患者さんごとのindex
   @ostomies = Ostomy.all.page(params[:page]).per(7).reverse_order
   @patient = Patient.find(patient.id)
  end

  def show #showページでコメントを作る
    @comment = Comment.new
    @ostomy = Ostomy.find(params[:id])
  end

  def create
    @ostomy = Ostomy.find(params[:ostomy_id])
    @comment = current_staff.comment.new(comment_params)
    @comment.ostomy_id = ostomy.id
    if @comment.save
     redirect_to staff_ostomy_path(@ostomy)
    else
     render :show
    end
  end

  def destroy
  end

  private
  def ostomy_params
      params.require(:ostomy).permit(:color,:edema,:skin,:h_size,:w_size,:comment,:image)
  end
end
