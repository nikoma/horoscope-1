module UserHelper

  def add_zn_zd(user)  #add sign of the zodiac
    @zodiacs = Zodiac.all
    @zodiacs.each do |zd|
      b_dt = Date.strptime(zd.begin_dt, "%m-%d")
      e_dt = Date.strptime(zd.end_dt, "%m-%d")
      dt_b = Date.strptime(Date.parse(user.dt_of_b).strftime("%m-%d"), "%m-%d")
      if zd.id_zd == 10
        e_dt = e_dt + 1.year
	if dt_b >= Date.strptime('01-01', "%m-%d") && dt_b <= Date.strptime(zd.end_dt, "%m-%d")
	  dt_b = dt_b + 1.year
	end
      end
      if (dt_b >= b_dt) && (dt_b <= e_dt)
	user.update_attribute(:id_zd, zd.id_zd)
      end
    end
  end
  
  def sign_in(user, n)  #add cookies user
    if n == 1 
      cookies.permanent[:token] = user.id
    else 
      cookies[:token] = user.id #{ value: token, expires: 1.days.from_now.utc }
    end
    self.current_user = user
  end
  
  def sign_out
    cookies.delete(:token)
    reset_session
    self.current_user = nil
  end
  
  def signed_in?  #check user
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user  #current user
    @current_user ||= User.find(cookies[:token]) if cookies[:token]
  end
end
