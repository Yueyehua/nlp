module NLP
  module Parser
    module LanguageRecognitionParser
      extend self

      def find_regex(str : String, regexp : Regex) : Bool
        str.match(regexp).nil? ? false : true
      end

      def is_afrikaans?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_arabic?(str : String) : Bool
        find_regex(str, /\p{Arabic}/)
      end

      def is_armenian?(str : String) : Bool
        find_regex(str, /\p{Armenian}/)
      end

      def is_belarusian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[щяюй]/i) &&
          find_regex(str, /[ёыэ]/i) &&
          !find_regex(str, /[јљњџѓќѕђћищ]/i)
      end

      def is_bengali?(str : String) : Bool
        find_regex(str, /\p{Bengali}/)
      end

      def is_bulgarian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[щяюй]/i) &&
          find_regex(str, /ъ/i) &&
          !find_regex(str, /[јљњџѓќѕђћ]/i)
      end

      def is_catalan?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_chinese?(str : String) : Bool
        find_regex(str, /\p{Han}/) && !is_japanese?(str) && !is_korean?(str)
      end

      def is_cyrillic?(str : String) : Bool
        find_regex(str, /\p{Cyrillic}/)
      end

      def is_danish?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_devanagari?(str : String) : Bool
        find_regex(str, /\p{Devanagari}/)
      end

      def is_dutch?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_english?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_faroese?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_french?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_galician?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_georgian?(str : String) : Bool
        find_regex(str, /\p{Georgian}/)
      end

      def is_german?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_greek?(str : String) : Bool
        find_regex(str, /\p{Greek}/)
      end

      def is_guarani?(str : String) : Bool
        is_latin?(str) && find_regex(str, /g̃/i)
      end

      def is_gujarati?(str : String) : Bool
        find_regex(str, /\p{Gujarati}/)
      end

      def is_gurmukhi?(str : String) : Bool
        find_regex(str, /\p{Gurmukhi}/)
      end

      def is_hebrew?(str : String) : Bool
        find_regex(str, /\p{Hebrew}/)
      end

      def is_icelandic?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_italian?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_japanese?(str : String) : Bool
        find_regex(str, /\p{Hiragana}|\p{Katakana}|[\x{3000}-\x{303F}]/)
      end

      def is_latin?(str : String) : Bool
        find_regex(str, /\p{Latin}/)
      end

      def is_khmer?(str : String) : Bool
        find_regex(str, /\p{Khmer}/)
      end

      def is_korean?(str : String) : Bool
        find_regex(str, /\p{Hangul}/)
      end

      def is_macedonian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[јљњџ]/i) &&
          find_regex(str, /[ѓќѕ]]/i) &&
          !find_regex(str, /[ъщяюй]/i)
      end

      def is_norwegian?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_persian?(str : String) : Bool
        is_arabic?(str) && find_regex(str, /پ|چ|ژ|گ/i)
      end

      def is_portuguese?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_romanian?(str : String) : Bool
        is_latin?(str) && find_regex(str, /șț/)
      end

      def is_russian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[щяюй]/i) &&
          find_regex(str, /[ёыэ]/i) &&
          !find_regex(str, /[јљњџѓќѕђћ]/i)
      end

      def is_serbian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[јљњџ]/i) &&
          find_regex(str, /[ђћ]/i) &&
          !find_regex(str, /[ъщяюй]/i)
      end

      def is_spanish?(str : String) : Bool
        is_latin?(str) && find_regex(str, /¿¡/)
      end

      def is_swedish?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def is_tamil?(str : String) : Bool
        find_regex(str, /\p{Tamil}/)
      end

      def is_tibetan?(str : String) : Bool
        find_regex(str, /\p{Tibetan}/)
      end

      def is_ukrainian?(str : String) : Bool
        is_cyrillic?(str) &&
          find_regex(str, /[єиіїйґєщ]/i) &&
          !find_regex(str, /[ъёыэ]/i)
      end

      def is_urdu?(str : String) : Bool
        is_arabic?(str) && find_regex(str, /ٹ‎|ڈ‎|ڑ‎|ں|ے/i)
      end

      def is_walloon?(str : String) : Bool
        is_latin?(str) && false # TODO define a solution to recognize
      end

      def parse(str : String) : NLP::Language | Nil
        case
        when is_japanese?(str)   then NLP::Language::Japanese
        when is_korean?(str)     then NLP::Language::Korean
        when is_chinese?(str)    then NLP::Language::Chinese
        when is_khmer?(str)      then NLP::Language::Khmer
        when is_bengali?(str)    then NLP::Language::Bengali
        when is_devanagari?(str) then NLP::Language::Devanagari
        when is_gujarati?(str)   then NLP::Language::Gujarati
        when is_gurmukhi?(str)   then NLP::Language::Gurmukhi
        when is_tibetan?(str)    then NLP::Language::Tibetan
        when is_hebrew?(str)     then NLP::Language::Hebrew
        when is_greek?(str)      then NLP::Language::Greek
        when is_armenian?(str)   then NLP::Language::Armenian
        when is_georgian?(str)   then NLP::Language::Georgian
        when is_ukrainian?(str)  then NLP::Language::Ukrainian
        when is_serbian?(str)    then NLP::Language::Serbian
        when is_macedonian?(str) then NLP::Language::Macedonian
        when is_belarusian?(str) then NLP::Language::Belarusian
        when is_bulgarian?(str)  then NLP::Language::Bulgarian
        when is_russian?(str)    then NLP::Language::Russian
        when is_urdu?(str)       then NLP::Language::Urdu
        when is_persian?(str)    then NLP::Language::Persian
        when is_arabic?(str)     then NLP::Language::Arabic
        when is_tamil?(str)      then NLP::Language::Tamil
        when is_guarani?(str)    then NLP::Language::Guarani
        when is_spanish?(str)    then NLP::Language::Spanish
        when is_romanian?(str)   then NLP::Language::Romanian
        when is_french?(str)     then NLP::Language::French
        when is_italian?(str)    then NLP::Language::Italian
        when is_catalan?(str)    then NLP::Language::Catalan
        when is_portuguese?(str) then NLP::Language::Portuguese
        when is_walloon?(str)    then NLP::Language::Walloon
        when is_galician?(str)   then NLP::Language::Galician
        when is_english?(str)    then NLP::Language::English
        when is_dutch?(str)      then NLP::Language::Dutch
        when is_afrikaans?(str)  then NLP::Language::Afrikaans
        when is_german?(str)     then NLP::Language::German
        when is_swedish?(str)    then NLP::Language::Swedish
        when is_danish?(str)     then NLP::Language::Danish
        when is_norwegian?(str)  then NLP::Language::Norwegian
        when is_icelandic?(str)  then NLP::Language::Icelandic
        when is_faroese?(str)    then NLP::Language::Faroese
        when is_latin?(str)      then NLP::Language::Latin
        end
      end
    end
  end
end
