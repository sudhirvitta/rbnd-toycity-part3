# lib/errors.rb

class DuplicateProductError < StandardError
end

class ProductNotFoundError < StandardError
end

class DuplicateCustomerError < StandardError
end

class CustomerNotFoundError < StandardError
end

class OutOfStockError < StandardError
end
