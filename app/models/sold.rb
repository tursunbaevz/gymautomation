class Sold < ApplicationRecord
	# has_many :products, :through => :sold_products
	# has_many :sold_products

	belongs_to :product
	# accepts_nested_attributes_for :sold_products, allow_destroy: true
	
	validate :has_enough_product

	# rails ActiveRecord callbacks
	after_create :on_after_create
	after_update :on_after_update


	private

	def has_enough_product
		
		#  if it is being created
		if id.nil? 

			if product.p_quantity < sold_quantity  
				errors.add(:sold_quantity, "Can't sell more than #{product.p_quantity}")
			end
		
		# if it is being changed
		else    #remainder           # old quantity 	
				total_quantity = product.p_quantity + sold_quantity_was
			if  total_quantity < sold_quantity
				
				errors.add(:sold_quantity, "Can't sell more than #{total_quantity}")
			end
		end


	end

	def on_after_update
		return if sold_quantity == sold_quantity_was

		if sold_quantity < sold_quantity_was
			# product.p_quantity = product.p_quantity + (sold_quantity_was - sold_quantity)

			product.p_quantity += sold_quantity_was - sold_quantity
			product.save


		else

			product.p_quantity = product.p_quantity - (sold_quantity - sold_quantity_was )
			product.save

		end
	end


	def on_after_create

		product.p_quantity = product.p_quantity - sold_quantity
		product.save

	end

end
