class Staff::SearchesController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_q, only: [:search]

  def search
    @results = @q.result
    @patients = @q.result(distinct: true)
  end

  private

  def set_q
    @q = Patient.ransack(params[:q])
  end

end
