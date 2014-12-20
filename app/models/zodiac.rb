class Zodiac < ActiveRecord::Base
  validates :id_zd, presence: true
  validates :name, presence: true
  validates :begin_dt, presence: true, length: { maximum: 5, minimum: 5 }
  validates :end_dt, presence: true, length: { maximum: 5, minimum: 5 }
end