require 'spec_helper'

describe ArticlesController do
	render_views
	before(:each) do
        @article = Factory(:article)
    end
	describe "GET 'article'" do
		it "should be successful" do
			get :show , :id => @article 
			response.should be_success
		end
		it "should have right title" do
			get :show , :id => @article
            response.should have_selector("title" , :content => @article.articleTitle)
		end
		
	end
end
