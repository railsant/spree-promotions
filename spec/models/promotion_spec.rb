require File.dirname(__FILE__) + '/../spec_helper'

describe Promotion do
  before(:each) do
    @promotion = Promotion.new
  end

  it "should be valid" do
    @promotion.should be_valid
  end
end
