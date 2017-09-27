class Customer < ApplicationRecord
	has_many :payments


	validates :published_on, :presence => true

	
	accepts_nested_attributes_for :payments, allow_destroy: true

  
end
