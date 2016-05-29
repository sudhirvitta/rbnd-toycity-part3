# customer.rb

class Customer
	attr_reader :name, :my_transactions

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		@my_transactions = Array.new 
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name) 
		if (found = @@customers.select { |customer| customer.name == name}).empty?
			raise CustomerNotFoundError, "#{name} product not found"
		else
			found.pop
		end	
	end

	def purchase(product)
			if product.in_stock?	
				@my_transactions << Transaction.new(self, product)
			else
				raise OutOfStockError, "#{product.title} is out of stock"
			end
	end

	def show_my_purchases
		puts "#{self.name} order history"
		@my_transactions.each { |order| puts "Product: #{order.product.title}"}
	end

	def add_to_purchase_list(transaction)
		@my_transactions << transaction
	end

	private	

	def search_customer(name)
		@@customers.select { |customer| customer.name == name}
	end

	def add_to_customers
		if search_customer(self.name).empty?
			@@customers << self
		else
			raise DuplicateCustomerError, "#{self.name} already exists."	
		end
	end

end
