require "json"

module NLP
  class Corpus < Collection
    def initialize(path : String)
      case
      when File.directory?(path) then  load_files(path)
      when File.file?(path), File.symlink?(path) then read_file(path)
      else @item = Array(NLP::Entity).new
      end
    end

    private def is_json?(str : String)
      JSON.parse(str)
      true
    rescue e
      false
    end

    private def load_files(path : String)
      Dir.new(path).each_child do |f|
        @item.push(NLP::Text.new(File.read(File.join(path, f)), title: f))
      end
    end

    private def parse_json(str)
      str.as_a.each do |t|
        @item.push(NLP::Text.new(
          t["item"],
          title: t["title"],
          lang: t["lang"]
        ))
      end
    end

    private def read_file(path : String)
      file = File.read(path)
      case
      when is_json?(file) then parse_json(file)
      end
    end
  end
end
