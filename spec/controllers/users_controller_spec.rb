require 'spec_helper'

describe UsersController do
    render_views
  describe "GET 'new'" do
    it "should returns http success" do
      get 'new'
      response.should be_success
    end
    it "should have the correct tittle" do
        get 'new'
        response.should have_selector("title" , :content => "Sign up")
    end
  end



end
