class Staff::RecordsController < ApplicationController
  def new
  end

  def create
  end 
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  def index
  end 

private
 def staff_params
   require.(:staff).piremit.(:name,:email,:imege_id,:password)
 end
end
