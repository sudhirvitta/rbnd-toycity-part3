# transaction.rb

class Transaction
	attr_reader :id, :product, :customer

	@@id = 1
	@@transactions = []

	def initialize(customer, product)
    @id = @@id
    @@id += 1
		@product = product
		@customer = customer
		
		# new transaciton, so need to reduce stock
		if @product.in_stock?
			@product.reduce_stock
		else
			raise OutOfStockError, "#{@product.title} is out of stock"
		end
		@@transactions << self

  end

	def self.all
		@@transactions	
	end

	def self.find(index)
		return @@transactions.fetch(index-1)
	end

end
