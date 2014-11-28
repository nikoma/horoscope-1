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
    if params[:user]
      @user = User.new(params.require(:user).permit(:email, :password, :dt_of_b))
 
      if @user.save
	@zodiacs = Zodiac.all
        redirect_to root_url #redirect_to @user
      else
	@user = User.new
        render 'signup'
      end
    end
  end
 
end