class Patient::DialiesController < ApplicationController
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
  
  def patient_params
    require.(:patient).permit(:name,:name_kana,:email,:image_id,:password)
  end
end
