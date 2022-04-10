class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :basic_info_modification, :list_of_employees]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :list_of_employees]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info, :list_of_employees, :basic_info_modification, :import]
  before_action :set_one_month, only: [:show]

  def index
    @users = User.all
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def basic_info_modification
  end
  
  def list_of_employees
    @in_attendances = Attendance.where(worked_on: Date.current)
                                 .where(finished_at: nil)
                                 .where.not(started_at: nil)
                                 .includes(:user)
  end
  
  def import
    if params[:file].blank?
      flash[:warning] = "CSVファイルが選択されていません。"
      redirect_to users_url and return
    elsif File.extname(params[:file].original_filename) != ".csv"
          flash[:warning] = "CSVファイルではありません。"
          redirect_to users_url and return
    else
      ActiveRecord::Base.transaction do
        User.import(params[:file])
      end
    end
    flash[:success] = "ユーザー情報をインポートしました。"
    redirect_to users_url
  rescue ActiveRecord::RecordInvalid
      flash[:warning] ="無効な入力データがあった為、追加更新をキャンセルしました。"
      redirect_to users_url
  end
  

  

  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end

    def basic_info_params
      params.require(:user).permit(:name,
                                   :email,
                                   :department,
                                   :password,
                                   :employee_number,
                                   :uid,
                                   :designated_work_start_time,
                                   :designated_work_end_time,
                                   :basic_time,
                                   :work_time)
    end

end

