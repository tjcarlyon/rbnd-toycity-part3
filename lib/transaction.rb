 class transaction
    attr_reader :customer, :product,:id

 	@@transaction = []
 	@@id =0

 	def initialize(customer, product)
 		@customer= customer
 		@product= product
 		@id = @@id
 		add_to_transaction
 	end

 	def self.all
    @@transaction
  end

  def self.id
		@@id
	end

  def self.find_by_customer(name)
  	@@transaction.find {|transaction| transaction.customer == transaction}
  end 
