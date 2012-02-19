require 'spec_helper'

describe UsersController do
    render_views
    describe "GET 'show'" do
        before(:each) do
            @user = Factory(:user)
        end
        it "should be successful" do
            get(:show,:id => @user.id, ) 
            response.should be_success
        end
        it "should find the right user" do
            get(:show,:id => @user.id, )
            assigns(:user).should == @user
        end
        it "should have the right title" do
            get(:show,:id => @user.id,)
            response.should have_selector("title", :content => @user.name, ) #response = http related test
        end
        it "should have the right name" do
            get(:show,:id => @user.id, )
            response.should have_selector("h1",:content => @user.name, )
        end
        it "should have a profile image" do
            get(:show,:id => @user.id, )
            response.should have_selector("h1>img",:class => 'gravatar')
        end
    end
    describe "GET 'new'" do
        it "should returns http success" do
            get :new
            response.should be_success
        end
        it "should have the correct title" do
            get :new
            response.should have_selector("title" , :content => "Sign up")
        end
    end
    describe "Post 'create'" do
        before(:each) {
            @attr = {:name => "",:email => "",:password => "", :password_confirmation => "" }
        }
        it "should not create a user" do
            lambda do
            post(:create , :user => @attr)
            end.should_not change(User,:count) 
        end
        it "should have the right title" do
            post(:create,:user => @attr, )
            response.should have_selector("title", :content => "Sigh Up", )
        end
        it "should render new page" do
            post(:create,:user => @attr, )
            response.should render_template('new')
        end
    end 
end
