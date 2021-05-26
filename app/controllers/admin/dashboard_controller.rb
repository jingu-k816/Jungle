class Admin::DashboardController < ApplicationController
  def show
    @admin_products = Product.count
    @categories = Category.count
  end
end
