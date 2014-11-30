class UserController < ApplicationController
  
  def home #main page
    @zodiacs = Zodiac.all
  end
  
  def index #all users
    if signed_in?
      @user = User.all
    else 
      flash[:error] = "Not allowed to view..."
      redirect_to root_url
    end
  end
  
  def show #user account
    if signed_in?
      @user = User.find(params[:id])
    else 
      flash[:error] = "Not allowed to view..."
      redirect_to root_url
    end
  end
  
  def signin #user login
    if params[:user]
      @user = User.find_by(email: params[:user][:email].downcase)
      if @user && @user.authenticate(params[:user][:password])
	flash[:success] = "Welcome to the Horoscope!"
	sign_in @user
	redirect_to @user
      else
	flash.now[:error] = "Invalid combination..."
        render 'signin'
      end
    end
  end
  
  def signup #user registration
    @user = User.new
    if params[:user]
      @user = User.new(user_params) 
      if @user.save
	add_zn_zd @user
	sign_in @user
	flash[:success] = "Welcome to the Horoscope!"
	redirect_to @user
      else
        render 'signup'
      end
    end
  end
 
  def signout #user exit
    sign_out
    redirect_to root_url  
  end
  
  
  #---------------------------------------------------
  def sign_in(user)  #add cookies user
    token = User.new_token
    cookies.permanent[:token] = token #{ value: token, expires: 1.days.from_now.utc }
    user.update_attribute(:remember_token, User.encrypt(token))
    self.current_user = user
  end
  
  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt(User.new_token))
    cookies.delete(:token)
    self.current_user = nil
  end
  
  def signed_in?  #check user
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user  #current user
    token = User.encrypt(cookies[:token])
    @current_user ||= User.find_by(remember_token: token)
  end
  
  
  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :dt_of_b)
    end
end