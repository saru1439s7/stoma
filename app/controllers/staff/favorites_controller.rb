class Staff::FavoritesController < ApplicationController
   #医療staffが患者さん記録にいいねつける
 before_action :authenticate_staff!
 
  def create
    @ostomy = Ostomy.find(params[:ostomy_id])
    favorite = @ostomy.favorites.new(staff_id: current_staff.id)
    favorite.save
  end

  def destroy
    @ostomy = Ostomy.find(params[:ostomy_id])
    favorite = @ostomy.favorites.find_by(staff_id: current_staff.id)
    favorite.destroy
  end


  private
  def ostomy_params
    params.require(:ostomy).permit(:color,:edema,:skin,:h_size,:w_size,:comment,:image)
  end
  
end
