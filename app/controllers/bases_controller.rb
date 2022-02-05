class BasesController < ApplicationController
  
  def show
    @base = Base.find(params[:id])
  end
  
  def edit
  end
end
