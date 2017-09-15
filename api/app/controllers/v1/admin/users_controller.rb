class V1::Admin::UsersController < ApplicationController
  before_action :set_user,:only => [:show,:edit,:update,:destroy]

  def index
    @users = User.page(page).per(page_size)
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      success message: "#{@user.name} 用户保存成功!"
    else
      error message: "#{@user.name} 用户保存失败!"
    end
  end

  def update
    if @user.update!(user_params)
      success message: "#{@user.name} 用户更新成功!"
    else
      error message: "#{@user.name} 用户更新失败!"
    end
  end

  def destroy
    if @user.destroy!
      success message: "#{@user.name} 用户删除成功!"
    else
      error message: "#{@user.name} 用户删除失败!"
    end
  end


  private

  def user_params
    params.require(:user).permit(User.attribute_names)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
