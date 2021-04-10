class Order < ActiveRecord::Base

  belongs_to :users
  has_many :sages, through: :orderedsages

end
