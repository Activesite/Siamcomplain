require 'spec_helper'

describe PagesController do
   render_views
    
    describe "GET 'home'" do
        it 'should be successful' do
            get 'home'
            response.should be_success
        end
    end

    describe "GET 'contactUS'" do
        it 'should be successful' do
            get 'contactUs'
            response.should be_success
        end
    end
end 