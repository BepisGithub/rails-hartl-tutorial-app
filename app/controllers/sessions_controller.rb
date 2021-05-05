class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    # stop if @user.nil?
    if user && user.authenticate(params[:session][:password])
      # log in
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      # dont log in and instead show errors + log in form
      flash.now[:danger] = 'Wrong log in information!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
    def session_params
      params.permit(:session).require(:email, :password)
    end
end
