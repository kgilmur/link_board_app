class SessionsController < ApplicationController


  # Login (GET)
  def new
  end

  #Set Session (POST)
  def create
    # @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Login Successful! Now you can post."
      redirect_to root_path
    else
      flash[:danger] = "Credentials Invalid"
      render :new
    end
  end

  #Destroy Session(DELETE typically)
  def destroy
    session[:user_id] = nil
    flash[:info] = "User has logged out."
    redirect_to login_path
  end

end