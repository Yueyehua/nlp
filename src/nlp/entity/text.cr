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

    def frequency_map : Hash(String, Int32)
      h = Hash(String, Int32).new
      tokenize.each do |e|
        h[e] = 0 unless h.has_key?(e)
        h[e] += 1
      end
      h
    end

    def lemmatize
      # TODO: Put your code here
    end

    def stem
      # TODO: Put your code here
    end

    def tokenize
      detect_language
      @item.split(/[\s\p{Z}\p{P}]+/) # TODO run tokenize depending on language
    end
  end
end
