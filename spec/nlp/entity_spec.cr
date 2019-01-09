require "../spec_helper"

describe NLP::Entity do
  it "should create a nil entity." do
    e = NLP::Entity(Nil).new
    e.should be_a NLP::Entity(Nil)
    e.item.should be nil
  end
  it "should create a string entity." do
    e = NLP::Entity(String).new "Test"
    e.should be_a NLP::Entity(String)
    e.item.should be "Test"
    e.item.should be_a String
  end
end
