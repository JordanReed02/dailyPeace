class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :sages

  has_many :explenation, through: :sage
  has_many :thought, through: :sage
  has_many :analysis, through: :sage
end
