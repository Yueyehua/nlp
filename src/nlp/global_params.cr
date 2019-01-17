module NLP
  CORPUS_DIR = File.join(File.real_path(__DIR__), # TODO: set all this dynamic
    "corpus", "udhr")
  ARAB_LANG = {
    NLP::Language::Arabic => File.read(
      File.join(CORPUS_DIR, "Arabic.txt")),
    NLP::Language::Persian => File.read(
      File.join(CORPUS_DIR, "Persian.txt")),
    NLP::Language::Urdu => File.read(
      File.join(CORPUS_DIR, "Urdu.txt")),
  }
  CYRL_LANG = {
    NLP::Language::Belarusian => File.read(
      File.join(CORPUS_DIR, "Belarusian.txt")),
    NLP::Language::Bulgarian => File.read(
      File.join(CORPUS_DIR, "Bulgarian.txt")),
    NLP::Language::Macedonian => File.read(
      File.join(CORPUS_DIR, "Macedonian.txt")),
    NLP::Language::Russian => File.read(
      File.join(CORPUS_DIR, "Russian.txt")),
    NLP::Language::Serbian => File.read(
      File.join(CORPUS_DIR, "Serbian.txt")),
    NLP::Language::Ukrainian => File.read(
      File.join(CORPUS_DIR, "Ukrainian.txt")),
  }
  LATN_LANG = {
    NLP::Language::Afrikaans => File.read(
      File.join(CORPUS_DIR, "Afrikaans.txt")),
    NLP::Language::Catalan => File.read(
      File.join(CORPUS_DIR, "Catalan.txt")),
    NLP::Language::Danish => File.read(
      File.join(CORPUS_DIR, "Danish.txt")),
    NLP::Language::Dutch => File.read(
      File.join(CORPUS_DIR, "Dutch.txt")),
    NLP::Language::English => File.read(
      File.join(CORPUS_DIR, "English.txt")),
    NLP::Language::Faroese => File.read(
      File.join(CORPUS_DIR, "Faroese.txt")),
    NLP::Language::French => File.read(
      File.join(CORPUS_DIR, "French.txt")),
    NLP::Language::Galician => File.read(
      File.join(CORPUS_DIR, "Galician.txt")),
    NLP::Language::German => File.read(
      File.join(CORPUS_DIR, "German.txt")),
    NLP::Language::Icelandic => File.read(
      File.join(CORPUS_DIR, "Icelandic.txt")),
    NLP::Language::Italian => File.read(
      File.join(CORPUS_DIR, "Italian.txt")),
    NLP::Language::Latin => File.read(
      File.join(CORPUS_DIR, "Latin.txt")),
    NLP::Language::Norwegian => File.read(
      File.join(CORPUS_DIR, "Norwegian.txt")),
    NLP::Language::Portuguese => File.read(
      File.join(CORPUS_DIR, "Portuguese.txt")),
    NLP::Language::Romanian => File.read(
      File.join(CORPUS_DIR, "Romanian.txt")),
    NLP::Language::Spanish => File.read(
      File.join(CORPUS_DIR, "Spanish.txt")),
    NLP::Language::Swedish => File.read(
      File.join(CORPUS_DIR, "Swedish.txt")),
    NLP::Language::Walloon => File.read(
      File.join(CORPUS_DIR, "Walloon.txt")),
  }
end
