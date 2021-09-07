class Staff::StaffsController < ApplicationController
  
  def show
   @staff = current_staff
  end
  
  def edit
   @staff = current_staff
  end
  
  def update
    @staff = current_staff
   if @staff.update(staff_params)
    redirect_to staff_path(current_staff) , notice: "更新しました" 
   else
    render 'edit'
   end
  end
 
 private
 def staff_params
   params.require(:staff).permit(:name,:email,:image_id,:password)
 end
end
