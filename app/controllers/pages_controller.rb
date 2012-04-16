class PagesController < ApplicationController
  def home
  	@article = Article.all; 
  	
  end

  def contactUs
  end

end
