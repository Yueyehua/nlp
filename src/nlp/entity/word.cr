module NLP
  class Word < Entity(String)
    property lang : NLP::Language | Nil

    def initialize(@item : String, @lang = nil)
    end

    def initialize(@item : String, lang : String | Symbol)
      @lang = NLP::Language.search(lang.to_s)
    end

    def lemmatize
      # TODO: Put your code here
    end

    def stem
      # TODO: Put your code here
    end
  end
end
