class UserController < ApplicationController  
  include UserHelper
  before_action :signedin_user, only: [:index, :show]
 
  def home #main page
    @zodiacs = Zodiac.all
  end
  
  def index #all users
    #@user = User.all
    @user = User.paginate(page: params[:page])
  end
  
  def show #user account
    @user = User.find(params[:id])
    @horoscope_text = "Oops, there is nothing..."
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
    
    def signedin_user
      unless signed_in?
        flash[:error] = "Not allowed to view... Please sign in..."
        redirect_to signin_url
      end
    end
end