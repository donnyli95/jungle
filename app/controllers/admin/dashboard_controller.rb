class Admin::DashboardController < ApplicationController
  include HttpAuthConcern
   
  def show
    @productCount = Product.count
    @categoryCount = Category.count
  end
end
