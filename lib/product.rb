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
    @@products.find {|product| product.title == title}
  end 

  def in_stock?
    @stock != 0
  end

  
  
  def self.in_stock
    @@products.find_all {|product| product.in_stock?}
  end

  private

  def add_to_products

    unless (@@products.any? { |product| product.title == title})
      @@products << self
    else  
      raise DuplicateProductError, " '#{title}' already exists."
      end
  end
end


