class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validate :valid_dt_of_b?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_DT_REGEX = /\A\d{4}\-(?:0?[1-9]|1[0-2])\-(?:0?[1-9]|[1-2]\d|3[01])\Z/
  validates :email, presence: true, length: { maximum: 50, minimum: 3 }, 
      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :dt_of_b, presence: true, length: { maximum: 10, minimum: 8 },
      format: { with: VALID_DT_REGEX }
  
  has_secure_password
  validates :password, presence: true, length: { maximum: 50, minimum: 6 }
end

private

  def valid_dt_of_b?
    if dt_of_b.present?
      unless dt_of_b.to_date.is_a?(Date)
        errors.add(:dt_of_b, "is an invalid date")
      end
      
      dt_now = Time.now.strftime("%Y-%m-%d")
      unless dt_of_b.to_date <= dt_now.to_date
        errors.add(:dt_of_b, "is an invalid date > Now")
      end
    end
  end