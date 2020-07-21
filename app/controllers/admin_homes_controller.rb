class AdminHomesController < ApplicationController
  def top
  	@orders = Order.where("DATE(created_at) = '#{Date.today}'")
  end


end
