class BasesController < ApplicationController
  before_action :admin_user
  
  def index
    @bases = Base.all
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点情報が追加されました。"
      redirect_to bases_url
    else
      flash[:danger] = "拠点情報の更新に失敗しました。"
      render :new
    end
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to bases_url
    else
      flash[:danger] = '拠点情報の更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @base = Base.find(params[:id])
    @base.destroy
    flash[:success] = "#{@base.base_name}のデータを削除しました。"
    redirect_to bases_url
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
  end
  
  private
  
  def base_params
    params.require(:base).permit(:base_id, :base_name, :base_type)
  end
    
end
