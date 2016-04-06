class Customer
  attr_reader :name, :cust_id

  @@customers = []
  @@customer_id = 0

  def initialize(options={})
    @name = options[:name]
    @cust_id = @@customer_id += 1
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find {|customer| customer.name == name}
  end

  def self.find(id)
    @@customers.find {|customer| customer.cust_id == id}
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  def to_s
    "#{@name}"
  end

  private

  def add_to_customers
    @@customers.each do |customer|
      if customer.name == @name
        raise DuplicateCustomerError, "#{@name} already exists."
      end
    end
    @@customers << self
  end

end