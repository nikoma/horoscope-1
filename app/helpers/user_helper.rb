module UserHelper

  def add_zn_zd(user)  #add sign of the zodiac
    @zodiacs = Zodiac.all
    @zodiacs.each do |zd|
      b_dt = Date.parse(zd.begin_dt).strftime("%d/%m/2014")
      e_dt = Date.parse(zd.end_dt).strftime("%d/%m/2014")
      dt_b = Date.parse(user.dt_of_b).strftime("%d/%m/2014")
      if (dt_b.to_date >= b_dt.to_date) && (dt_b.to_date <= e_dt.to_date)
	user.update_attribute(:id_zd, zd.id_zd)
      end
    end
  end
  
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
end
