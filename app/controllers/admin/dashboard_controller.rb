class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"], password: ENV["HTTP_BASIC_AUTH_PASSWORD"]


  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
