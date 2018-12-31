module NLP
  class LanguageException < Exception
  end

  enum Language
    English
    French
    Japanese

    def self.search(name : String | Symbol)
      self.parse(name)
    rescue e
      raise LanguageException.new e.message, e.cause
    end
  end
end
