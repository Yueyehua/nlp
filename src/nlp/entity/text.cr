module NLP
  class Text < Entity(String)
    property lang : NLP::Language | Nil
    property title : String

    def initialize(@title : String, @item : String, @lang = nil)
    end

    def initialize(@title : String, @item : String, lang : String | Symbol)
      @lang = NLP::Language.search(lang.to_s)
    end

    def detect_language
      # TODO: Put your code here
      # succeed or raise an error
    end

    def lemmatize
      # TODO: Put your code here
    end

    def stem
      # TODO: Put your code here
    end

    def tokenize
      detect_language
      # run tokenize depending on language
    end
  end
end
