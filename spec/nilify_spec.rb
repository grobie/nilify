require File.dirname(__FILE__) + '/spec_helper'
 
describe Grobie::Nilify do
  
  it "should add class method to activerecord" do
    User.methods.should include("nilify")
  end
  
  describe "when nilifiing possible attributes" do
    before(:each) do
      @user = User.new(:name => "", :salary => 0, :birthday => Time.at(0))
      @user.valid?
    end
    
    it "should nilify blank strings" do
      @user.name.should be_nil
    end
    
    it "should nilify blank integers" do
      @user.salary.should be_nil
    end
    
    it "should nilify default datetimes (1970/01/01)" do
      @user.birthday.should be_nil
    end
    
    it "should not nilify not specified values" do
      user = User.new(:not_null => "")
      user.valid?
      user.not_null.should == ""
    end
  end
  
  describe "when calling nilify without attributes" do
    before(:each) do
      class Post < ActiveRecord::Base
        nilify
      end
    end
    
    it "should do nothing" do
      post = Post.new(:name => "")
      post.valid?
      post.name.should == ""
    end
  end
  
end