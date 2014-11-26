require 'uri'

class UserController < ApplicationController
  def home
    @zodiacs = Zodiac.all
  end

  def signin
    if params[:user]
      @user = User.find_by(params[:email])
      #render plain: params[:user].inspect
      #go = URI params[:user]
      #if go.host.nil? && go.path
        #session[:user] = go.path
        #redirect_to 'home'
      #end
    end

  end
  
  def signup
    if params[:user]
      #render plain: params[:user].inspect
      @user = User.new(params.require(:user).permit(:email, :password, :dt_of_b))
 
      if @user.save
	@zodiacs = Zodiac.all
        redirect_to root_url #redirect_to @user
      else
        render 'signup'
      end
    end
  end
  
  def show
    #render 'home'
  end
  
end