class SessionsController < ApplicationController
    
  def new
    if logged_in?
      flash[:info] = "既にログインしています"
      redirect_back_or root_url
    end
  end
    
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
          if @user.activated?
            log_in @user
            params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
            flash[:success] = "ログインに成功しました。"
            redirect_back_or root_url
          else
            message = "アカウントを有効化していません。"
            message += "アカウント有効化のために、メールをご確認ください"
            flash[:warning] = message
            redirect_to root_url
          end
        else
            flash.now[:danger] = "Eメール、またはパスワードに誤りがあります"
            render 'new'
        end
    end
    
    def destroy
        log_out if logged_in?
        flash[:success] = "ログアウトしました"
        redirect_to root_url
    end
end
