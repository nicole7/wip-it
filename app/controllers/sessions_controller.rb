class SessionsController < ApplicationController
  def new
  end

  def create
    # auth = request.env["omniauth.auth"]
    # session[:omniauth] = auth.expect('extra')
    # user = User.sign_in_from_omniauth(auth)
    # session[:user_id] = user.idredirect_to root_url, notice: "SIGNED IN"
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = ["Your password/email combination are incorrect"]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    sessions[:omniauth] = nil
    redirect_to root_path, notice: "SIGNED OUT"
  end

end