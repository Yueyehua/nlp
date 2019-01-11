module NLP
  module StringMetric
    extend self

    def intersection_of(a : Hash(K, V), b : Hash(K, V)) forall K, V
      h = Hash(K, V).new
      a.each do |k, v|
        h[k] = Math.min(v, b[k]) if b.has_key? k
      end
      h
    end

    def union_of(a : Hash(K, V), b : Hash(K, V)) forall K, V
      a.merge(b) { |_, v1, v2| Math.max(v1, v2) }
    end
  end
end
