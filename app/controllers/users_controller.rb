class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 处理成功的保存
      flash[:success] = "Registration successful. Please log in."
      redirect_to login_path
    else
      render 'new', status: :unprocessable_entity, content_type: "text/html"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
