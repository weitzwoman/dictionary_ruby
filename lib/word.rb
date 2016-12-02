class Word
  attr_reader(:word, :id, :definitions)
  @@all = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@all.length + 1
    @definitions = []
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_singleton_method(:clear) do
    @@all = []
  end

  define_singleton_method(:all) do
    @@all
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@all.each do |word|
      if word.id() == identification.to_i
        found_word = word
      end
    end
    found_word
  end
end
