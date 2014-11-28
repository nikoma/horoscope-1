class UserController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def home
    @zodiacs = Zodiac.all
  end

  def signin
    if params[:user]
      @user = User.find_by(params[:email])
    end
  end
  
  def signup
    @user = User.new
    if params[:user]
      @user = User.new(user_params)
 
      if @user.save
	@zodiacs = Zodiac.all
	flash[:success] = "Welcome to the Horoscope!"
        #redirect_to root_url 
	redirect_to @user
      else
        render 'signup'
      end
    end
  end
 
  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation, :dt_of_b)
    end
end