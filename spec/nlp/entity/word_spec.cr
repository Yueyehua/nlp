require "../../spec_helper"

describe NLP::Word do
  it "should create a word." do
    e = NLP::Word.new "Word"
    e.should be_a NLP::Entity(String)
    e.should be_a NLP::Word
    e.item.should be_a String
    e.item.should be "Word"
    e.lang.should be_a Nil
  end
  it "should create a word with defined language." do
    e = NLP::Word.new "Word", :English
    e.should be_a NLP::Entity(String)
    e.should be_a NLP::Word
    e.item.should be_a String
    e.item.should be "Word"
    e.lang.should be_a NLP::Language
  end
  it "should split into ngrams." do
    e = NLP::Word.new "Word", :English
    n = e.ngram(2)
    n.should be_a Array(String)
    n.should eq ["Wo", "or", "rd"]
  end
end
