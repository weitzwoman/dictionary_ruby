class Word
  attr_reader(:word, :definition, :id)
  @@all = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = []
    # @id = @@all.length +1
  end

  # define_method(:save) do
  #
  # end

  # define_singleton_method(:clear) do
  #
  # end

  define_singleton_method(:all) do
    @@all
  end

  # define_method(:add_definition) do |definition|
  #   @definitions.push(definition)
  # end
  #
  # define_singleton_method(:find) do |identification|
  #   found_word = nil
  #   @@all.each do |contact|
  #     if word.id() == identification.to_i
  #       found_word = word
  #     end
  #   end
  #   found_word
  # end
end
