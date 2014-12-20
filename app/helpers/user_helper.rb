module UserHelper

  def add_zn_zd(user)  #add sign of the zodiac
    @zodiacs = Zodiac.all
    @zodiacs.each do |zd|
      b_dt = Date.parse('0000-'+zd.begin_dt).strftime("%d/%m/0001")
      e_dt = Date.parse('0000-'+zd.end_dt).strftime("%d/%m/0001")
      if zd.id_zd == 10
        e_dt = Date.parse('0000-'+zd.end_dt).strftime("%d/%m/0002")
      end
      dt_b = Date.parse('0000-'+user.dt_of_b).strftime("%d/%m/0001")
      if (dt_b.to_date >= b_dt.to_date) && (dt_b.to_date <= e_dt.to_date)
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
