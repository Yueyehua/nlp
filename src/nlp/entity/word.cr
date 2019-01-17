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

    def ngram(n : Int32)
      return [@item] unless @item.size > n
      a = Array(String).new
      i = 0
      while i < @item.size - n + 1
        a.push(@item[i, n])
        i += 1
      end
      a
    end

    def stem
      # TODO: Put your code here
    end
  end
end
