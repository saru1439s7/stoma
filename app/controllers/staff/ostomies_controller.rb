class Staff::OstomiesController < ApplicationController
   #医療スタッフが
   #患者さんが書いた記録を見てコメントする

  def index #患者さんごとのindex
   @ostomies = Ostomy.all
   @patient = Patient.find(patient.id)
  end

  def show #showページでコメントする
    @ostomy = Ostomy.find(patient.id)
    @comment = Comment.new
  end

  def create
    ostomy = Ostomy.find(params[:ostomy_id])
    comment = current_staff.comment.new(comment_params)
    comment.ostomy_id = ostomy.id
    if comment.save
     redirect_to ostomy_path(ostomy)
    else
     render :show
    end
  end

  def destroy
  end
end
