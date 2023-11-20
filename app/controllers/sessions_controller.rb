class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登录用户，重定向到用户的页面
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      # 创建一个错误消息
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity, content_type: "text/html"
    end
  end

  def destroy
  end
end
