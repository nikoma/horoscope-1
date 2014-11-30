class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_DT_REGEX = /\A[1900-2014]+\-[1-12]+\-[1-31]+\z/i
  validates :email, presence: true, length: { maximum: 50, minimum: 3 }, 
      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :dt_of_b, presence: true, length: { maximum: 10, minimum: 10 }
  #validates :id_zd, presence: true
  
  has_secure_password
  validates :password, presence: true, length: { maximum: 50, minimum: 6 }
end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
private
  
  def create_token
    self.remember_token = User.encrypt(User.new_token)
  end