class Staff::CommentsController < ApplicationController

  def create
    @ostomy = Ostomy.find(params[:ostomy_id])
    #@ostomy = Ostomy.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.staff_id = current_staff.id
    @comment.ostomy_id = @ostomy.id
    unless @comment.save!  #ここでエラー
     render 'error'
    end
    #if comment.save
    #redirect_to staff_ostomy_path(@ostomy)
    #else
     #render  :'staff/dialies/show'
    #end
  end

  def destroy
  end


 private
 def comment_params
 params.require(:comment).permit(:comment)
 end
end