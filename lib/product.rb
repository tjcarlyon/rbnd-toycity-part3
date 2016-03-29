  class Product
  attr_reader :title

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

  private

  def add_to_products
  unless (@@products.any? { |product| product.title == title})
			@@products << self
		else	
			raise DuplicateProductError, " '#{title}' already exists."
	    end
	end
end