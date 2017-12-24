class Payment < ApplicationRecord
	belongs_to :gym
	belongs_to :customer

	validates :payment_date, :presence => true
	validates :price, :presence => true

end
