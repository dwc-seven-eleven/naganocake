class AdminHomesController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@orders = Order.where("DATE(created_at) = '#{Date.today}'")
  end


end
