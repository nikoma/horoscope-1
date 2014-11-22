class UserController < ApplicationController
  def home
    @zodiacs = Zodiac.all
  end
  
  def signin
    render 'user/signin'
  end
  
  def signup
    render 'user/signup'
  end
  
end
