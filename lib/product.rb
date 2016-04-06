class Product
  attr_reader :title, :price, :stock, :brand

  @@products = []


  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @brand = options[:brand]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(product_title)
    @@products.each do |product|
      if product.title == product_title
      return product
      end
    end
  end

  def in_stock?
    @stock > 0
  end

  def purchase
    @stock -= 1
  end

  def self.in_stock
    @@products.find_all {|product| product.in_stock?}
  end

  def to_s
    "#{@title}"
  end

 
  


  private

  def add_to_products
    @@products.each do |add_product|
      if add_product.title == @title
        raise DuplicateProductError, "#{@title} already exists."
      end
    end
    @@products << self
  end

end