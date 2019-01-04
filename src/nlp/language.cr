module NLP
  class LanguageException < Exception
  end

  enum Language
    Afrikaans
    Arabic
    Armenian
    Belarusian
    Bengali
    Bulgarian
    Catalan
    Chinese
    Danish
    Devanagari
    Dutch
    English
    Faroese
    French
    Galician
    Georgian
    German
    Greek
    Guarani
    Gujarati
    Gurmukhi
    Hebrew
    Icelandic
    Italian
    Japanese
    Khmer
    Korean
    Latin
    Macedonian
    Norwegian
    Persian
    Portuguese
    Romanian
    Russian
    Serbian
    Spanish
    Swedish
    Tamil
    Tibetan
    Ukrainian
    Urdu
    Walloon

    def self.search(name : String | Symbol)
      self.parse(name.to_s)
    rescue e
      raise LanguageException.new e.message, e.cause
    end
  end
end
