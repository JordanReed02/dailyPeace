class Orderedsage < ActiveRecord::Base

  has_many :sages
  has_many :users, through: :orders
end
