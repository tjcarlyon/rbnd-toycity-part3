class Customer

	attr_reader :name

	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_custmers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.find {|customer| customer.name == name}
	end

	def add_to_custmers
		unless @@customers.any? {|customer| customer.name == name}
			@@customers << self
		else
			raise DuplicateCustomerError, "'#{name}' already exists."
		end
	end

	def purchase(product)
		Transaction.new(self,product)
	end

	def loyal_status
		count = Transaction.all.count {|transaction| transaction.customer == self}
		if count > 3
			return  "Loyal customer: Yes!"
		else
			return "Loyal customer: Not yet!"
		end
	end

end