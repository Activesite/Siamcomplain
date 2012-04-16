require 'spec_helper'

describe User do
    before(:each) do
        @attr ={:name => "Example User", 
                :email => "example-user@gmail.com",
                :password => "testtest",
                :confirm_password => "testtest"  }
    end

    it "should create new user with valid attribute" do
        User.create!(@attr)
    end
    
    it "should require name" do
        no_name_user = User.new(@attr.merge(:name => ""))
        no_name_user.should_not be_valid
    end
    
    it "should require email that is blank"do
        no_email_user = User.new(@attr.merge(:email => ""))
        no_email_user.should_not be_valid
    end
    
    it "should reject the name that is too long" do
        long_name = 'a'*51
        long_name_user = User.new(@attr.merge(:name => long_name ))
        long_name_user.should_not be_valid
    end
    
    it "should reject the invalid email" do
        email_addresses = %w[xxx@gmail,com SSS.COM  FFFF@hotmail]
        email_addresses.each do |address|
            invalid_email_address = User.new(@attr.merge(:email => address))
            invalid_email_address.should_not be_valid
        end
    end
    
    it "should reject the duplicate uppercase account" do
        upercase_account = @attr[:email].upcase
        User.create!(@attr.merge(:email => upercase_account ))
        duplicate_email_account = User.new(@attr)
        duplicate_email_account.should_not be_valid
    end
    it "should have the encryption password" do
        user = User.create!(@attr)
        user.should respond_to(:encrypted_password)
    
    end
    it "should require the password" do
        User.new(@attr.merge(:password => "",:confirm_password => "")).should_not be_valid  
    end
    
    it "should require the matching password" do
        User.new(@attr.merge(:password => "test",:confirm_password => "ddd"))
        .should_not be_valid
    end
    
    it "should reject the shorten password" do
        shorten_password = 'a'*5
        User.new(@attr.merge(:password => shorten_password, :confirm_password => shorten_password ))
        .should_not be_valid
    end
    
    it "should reject long password" do
        long_password = 'a'*41
        user_long_password = @attr.merge(:password => long_password ,:confirm_password => long_password)
        User.new(user_long_password).should_not be_valid
    end
    
    it "shouldset the encrypted password" do
        @user = User.create!(@attr)
        @user.encrypted_password.should_not be_blank
    end
    describe "password encryption" do 
        before(:each) do
            @user = User.create!(@attr)
        end
            
        describe "has_password? method" do
            it "should be true if password matched" do
                @user.has_password?(@attr[:password]).should be_true
            end
            it "should be false if password doesn't match" do
                @user.has_password?("invalid").should be_false
            end
        end
        
        describe "password authentication" do
            it "should return nill if the email/password doesn't match" do
                wrong_password_user = User.authentication(@attr[:email],"invalid password")
                wrong_password_user.should be_nil
            end
            it "should return user if the id mismatch" do
                invalid_user_id = User.authentication("foo_bar",@attr[:password])
                invalid_user_id.should be_nil
            end
            it "should return user if the id and password is match" do 
                valid_user = User.authentication(@attr[:email],@attr[:password])
                valid_user.should == @user
            end
        end
    end                
end
# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

