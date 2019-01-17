require "../../spec_helper"

describe NLP::Parser::LanguageRecognitionParser do
  it "should find regex." do
    str = "This is a sentence that match regex."
    b = NLP::Parser::LanguageRecognitionParser.find_regex(str, /regex/)
    b.should be_true
  end
  it "shouldn't find regex." do
    str = "This is a sentence without it."
    b = NLP::Parser::LanguageRecognitionParser.find_regex(str, /regex/)
    b.should be_false
  end
  NLP::Language.each do |lang|
    it "should detect #{lang}" do
      str = File.read(File.join(NLP_DIR, "spec", "samples", "#{lang}.txt"))
      l = NLP::Parser::LanguageRecognitionParser.parse(str)
      l.should be_a NLP::Language
      l.to_s.should be lang.to_s # TODO: Fix macedonian
    end
  end
end
