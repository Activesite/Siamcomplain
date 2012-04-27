require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ArticlesHelper. For example:
#
# describe ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
class TestStub
end
describe ArticlesHelper do

	before(:each) do
  		@stub = TestStub.new
  		@stub.extend(ArticlesHelper)
  		@testText = "Saran Yamasathien"
	end

	describe "text_shorten" do
		it "should shorten text" do
   			@stub.text_shorten(@testText,10).length.should == 10
  		end
	end
end
