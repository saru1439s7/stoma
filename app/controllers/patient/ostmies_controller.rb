class Patient::OstmiesController < ApplicationController

  def new
     @ostmy.new(ostmy_params)
  end

  def careate
     @ostmy.new(ostmy_params)
     @ostmy.save
  end

  def show
     @ostmy.new(params_ostmy)
  end

  def index
     @ostmies.all
  end

  def edit

  end

  def update

  end
　private
　def ostmy_params
　  require(:ostmy).permit.(:patitent_id,:color,:edema,:skin,:h_size,:w_size,:comment,:image_id)
　end
end
