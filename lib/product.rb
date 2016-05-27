# product.rb

class Product
	attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
  end

  def self.all
    @@products
  end

	def self.find_by_title(title) 
		if (found = @@products.select { |product| product.title == title}).empty?
			raise ProductNotFoundError, "#{title} product not found"
		else
			found.pop
		end	
	end

	def self.in_stock
		@@products.select {|product| product.stock != 0}
	end

	def in_stock?
		@stock != 0 ? true : false
	end

	def reduce_stock
		@stock = @stock-1
	end

	private	

	def search_product(title)
		@@products.select { |product| product.title == title}
	end

	def add_to_products
		if search_product(self.title).empty?
			@@products << self
		else
			raise DuplicateProductError, "#{self.title} already exists."	
		end
	end
	
end
