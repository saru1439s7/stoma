class Staff::CommentsController < ApplicationController
 before_action :authenticate_staff!

  def create
    @ostomy = Ostomy.find(params[:ostomy_id])
    @comment = Comment.new(comment_params)
    @comment.staff_id = current_staff.id
    @comment.ostomy_id = @ostomy.id
    if @comment.save
      @ostomy.create_notification_comment!(current_staff, @comment.id)
      # render 'error'
    end
  end

  def destroy
  end

  private
   def comment_params
    params.require(:comment).permit(:comment)
   end
end