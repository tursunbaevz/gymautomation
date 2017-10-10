class Customer < ApplicationRecord
	has_many :payments, :dependent => :destroy

	validates :published_on, :presence => true

	accepts_nested_attributes_for :payments, :allow_destroy => true

  
end
