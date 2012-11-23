require 'spec_helper'

describe Rome::Parser do
  context "Basic Numbers" do
  
    it "M = 1000" do
      Rome::Parser.parse("M").should == 1000
    end

    it "D = 500" do
      Rome::Parser.parse("D").should == 500
    end

    it "C = 100" do
      Rome::Parser.parse("C").should == 100
    end

    it "L = 50" do
      Rome::Parser.parse("L").should == 50
      
    end

    it "X = 10" do
      Rome::Parser.parse("X").should == 10
      
    end

    it "V = 5" do
      Rome::Parser.parse("V").should == 5
      
    end

    it "I = 1" do
      Rome::Parser.parse("I").should == 1
    end

    it "III = 3" do
      Rome::Parser.parse("III").should == 3
    end

    it "VI = 6" do
      Rome::Parser.parse("VI").should == 6 
    end
  end

  it "CCXII" do
    Rome::Parser.parse("CCXII").should == 212
  end

  it "IX = 9" do
    Rome::Parser.parse("IX").should == 9
  end

  it "takes small letters" do
    Rome::Parser.parse("iii").should == 3
  end

end