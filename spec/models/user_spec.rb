require 'spec_helper'

describe User do
    before(:each) do
        @attr ={:name => "Example User", :email => "example-user@gmail.com" }
    end

    it "should create newe user with valid attribute" do
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
end
# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

