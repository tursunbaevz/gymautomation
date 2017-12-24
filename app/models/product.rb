class Product < ApplicationRecord
	belongs_to :category
	# has_many :solds, :through => :sold_products
	# has_many :sold_products

	has_many :solds, dependent: :destroy

end
