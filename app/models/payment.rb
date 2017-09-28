class Payment < ApplicationRecord
	belongs_to :gym, optional: true
	belongs_to :customer, optional: true

	validates :payment_date, :presence => true
	validates :price, :presence => true

end
