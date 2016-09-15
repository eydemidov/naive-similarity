require "naive_similarity/version"
require "matrix"

module NaiveSimilarity
  def self.similar(object, collection, *keys)
    origin_vector = create_vector(object, keys)

    vectorized_array = []
    collection.each do |item|
      array_item = {item: item}
      vector = create_vector(item, keys)
      array_item[:cosine] = cosine(origin_vector, vector)
      vectorized_array << array_item
    end

    vectorized_array.reject { |hash| hash[:cosine].nan? }.sort_by { |hash| 1 - hash[:cosine] }.map { |el| el[:item] }
  end

  private

  def self.cosine(x, y)
    dot_product = x.inner_product(y)
    dot_product / (x.magnitude * y.magnitude)
  end

  def self.create_vector(item, keys)
    vector = []
    keys.each do |key|
      vector << item[key.to_sym].to_f
    end

    Vector.elements(fake_coordinate(vector))
  end

  # Add a fake coordinate for vector calculation purposes
  def self.fake_coordinate(vector)
    vector << 10.0 if vector.size == 1
    vector
  end
end
