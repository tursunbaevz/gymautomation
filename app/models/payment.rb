class Payment < ApplicationRecord
	belongs_to :gym, optional: true
	belongs_to :customer, optional: true
end
