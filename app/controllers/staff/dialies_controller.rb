class Staff::DialiesController < ApplicationController
  #医療スタッフが患者さんが書いた記録をみれてコメントする
  def index
    @dialies = Dialy.all
  end
  def show
    @dialy = Dialy.find(patient.id)
  end
  
  
end
