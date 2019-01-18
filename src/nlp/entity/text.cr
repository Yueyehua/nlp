module NLP
  class Text < Entity(String)
    property lang : NLP::Language | Nil
    property title : String | Nil

    def initialize(@item, @lang : NLP::Language | Nil = nil, @title = nil)
    end

    def initialize(@item, lang : String | Symbol, @title = nil)
      @lang = NLP::Language.search(lang)
    end

    def detect_language : NLP::Language | Nil
      @lang = NLP::Parser::LanguageRecognitionParser.parse(@item)
    end

    def lemmatize
      # TODO: Put your code here
    end

    def ngram(n : Int32) : Array(String)
      a = Array(String).new
      tokenize.each do |w|
        a += NLP::Word.new(w).ngram(n)
      end
      a
    end

    def ngram_frequency(n : Int32) : Hash(String, Int32)
      NLP::Parser::Frequency.count(ngram(n))
    end

    def stem
      # TODO: Put your code here
    end

    def tokenize : Array(String)
      a = NLP::Parser::Tokenizer.tokenize(@item, @lang)
      a.delete("")
      a
    end

    def word_frequency : Hash(String, Int32)
      NLP::Parser::Frequency.count(tokenize)
    end
  end
end
