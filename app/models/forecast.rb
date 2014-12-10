class Forecast < ActiveRecord::Base
  validates :id_zd, presence: true
  validates :dt, presence: true, length: { maximum: 10, minimum: 10 }
  validates :text, presence: true
end
