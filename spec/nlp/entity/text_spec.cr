require "../../spec_helper"

describe NLP::Word do
  it "should create a text." do
    e = NLP::Text.new "This is a text."
    e.should be_a NLP::Entity(String)
    e.should be_a NLP::Text
    e.item.should be_a String
    e.item.should be "This is a text."
    e.lang.should be_a Nil
    e.title.should be nil
  end
  it "should create a text with defined language." do
    e = NLP::Text.new "This is a text.", :English
    e.should be_a NLP::Entity(String)
    e.should be_a NLP::Text
    e.item.should be_a String
    e.item.should be "This is a text."
    e.lang.should be_a NLP::Language
    e.title.should be nil
  end
  it "should create a text with defined language and title." do
    e = NLP::Text.new "This is a text.", lang: "English", title: "title"
    e.should be_a NLP::Entity(String)
    e.should be_a NLP::Text
    e.item.should be_a String
    e.item.should be "This is a text."
    e.lang.should be_a NLP::Language
    e.title.should be_a String
    e.title.should be "title"
  end
  it "should detect the language." do
    e = NLP::Text.new("This is a text.")
    l = e.detect_language
    l.should be_a NLP::Language
    e.lang.should be_a NLP::Language
  end
  it "should split into ngrams." do
    e = NLP::Text.new "This is a test.", :English
    n = e.ngram(3)
    n.should be_a Array(String)
    n.should eq ["Thi", "his", "is", "a", "tes", "est"]
  end
  it "should split into tokens." do
    e = NLP::Text.new "This is a test.", :English
    t = e.tokenize
    t.should be_a Array(String)
    t.should eq ["This", "is", "a", "test"]
  end
  it "should count frequencies of words." do
    e = NLP::Text.new "This is a test.", :English
    f = e.word_frequency
    f.should be_a Hash(String, Int32)
    h = { "This" => 1, "is" => 1, "a" => 1, "test" => 1 }
    f.should eq h
  end
  it "should count frequencies of ngrams." do
    e = NLP::Text.new "An exemple.", :English
    f = e.ngram_frequency(4)
    f.should be_a Hash(String, Int32)
    h = { "An" => 1, "exem" => 1, "xemp" => 1, "empl" => 1, "mple" => 1 }
    f.should eq h
  end
end
