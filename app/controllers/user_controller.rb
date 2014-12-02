class UserController < ApplicationController
  include UserHelper
  
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
      @horoscope_text = "Oops, there is nothing..."
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
  
  
  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :dt_of_b)
    end
end