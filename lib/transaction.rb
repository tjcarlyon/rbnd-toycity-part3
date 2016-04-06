class Transaction
  attr_reader :id, :customer, :product, :date

  @@transactions = []
  @@transaction_id = 0

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@transaction_id += 1
    @date = Time.now.strftime("%A, %d %b %Y %l:%M %p") # timestamp
    sale_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find {|transaction| transaction.id == id}
  end

  def self.in_stock
    @@products.find_all {|product| product.in_stock?}
  end

  def to_s
    "Transaction ID: #{@id} Sale Date: #{@date} Customer: #{@customer} Product Purchased: #{@product}"
  end

 private

  def sale_transaction
    if product.in_stock?
      product.purchase
    else
      raise OutOfStockError, "#{product.title} is out of stock."
    end
    @@transactions << self
  end

end