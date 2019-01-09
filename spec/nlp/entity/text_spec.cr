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
end
