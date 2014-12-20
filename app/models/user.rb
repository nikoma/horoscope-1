class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_DT_REGEX = /\A\d{4}\-(?:0?[1-9]|1[0-2])\-(?:0?[1-9]|[1-2]\d|3[01])\Z/
  validates :email, presence: true, length: { maximum: 50, minimum: 3 }, 
      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :dt_of_b, presence: true, length: { maximum: 10, minimum: 8 },
      format: { with: VALID_DT_REGEX }
  
  has_secure_password
  validates :password, presence: true, length: { maximum: 50, minimum: 6 }
end