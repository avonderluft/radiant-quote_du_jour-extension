require File.dirname(__FILE__) + '/../spec_helper'

describe "QuoteDuJour::Tags" do
  dataset :pages, :quotes
  
  describe "<r:quote>" do
    it "should render a random quote" do
      pages(:home).should_not render('<r:quote />').as('')
    end
  end

end