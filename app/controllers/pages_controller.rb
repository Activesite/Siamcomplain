class PagesController < ApplicationController
  def home
  	@article = Article.all;
  	@title = "Siamcomplain Community" 
  	
  end

  def contactUs
  end

end
