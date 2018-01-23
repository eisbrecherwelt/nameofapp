class SimplePagesController < ApplicationController
  def index
  @products = Product.limit(3)
  render layout: "products"
  end
  def landing_page
    @products = Product.limit(3)
  end
end
