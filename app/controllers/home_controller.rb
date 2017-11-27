class HomeController < ApplicationController
  
  def index
  	@User = current_user
  end


end
