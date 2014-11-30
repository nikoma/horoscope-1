module UserHelper
  
  def add_zn_zd(user)  #add sign of the zodiac
    user.update_attribute(:id_zd, 11)
  end
  
  def sign_in(user)  #add cookies user
    token = User.new_token
    cookies.permanent[:token] = token #{ value: token, expires: 1.days.from_now.utc }
    user.update_attribute(:remember_token, User.encrypt(token))
    self.current_user = user
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
end
