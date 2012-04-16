class ArticlesController < ApplicationController
	def show
      @article = Article.find(params[:id])
      @title = @article.articleTitle
  	end
	def new
		@title = "Create Record"
	end
	def create
		
		@article = Article.new(params[:article])
	      if @article.save
	          redirect_to :controller => "pages" ,:action => "home"
	      else
	          @title = "Add Complain"
	          render 'new'
	      end
	end
	def destroy
			Article.find(params[:id]).destroy
			redirect_to root_path
		
	end
end
