module NLP
  class Entity(T)
    property title : String
    property item : T

    def initialize(@title : String, @item = nil)
    end
  end
end
