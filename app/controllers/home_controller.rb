class HomeController < ApplicationController
  def index
  	@country = Country.all
  end
end
