require('rspec')
require('word')
# require('definition')

describe(Word) do
  describe("#initialize") do
    it('tests for the word method and return word') do
      test_word = Word.new({:word => "sequioa", :definition => []})
      expect(test_word.word).to(eq("sequioa"))
    end
    it('tests for the definition method; initially empty') do
      test_word = Word.new({:word => "mountain", :definition => []})
      expect(test_word.definition).to(eq([]))
    end

  end
  describe(".all") do
    it('it is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  # it('tests for the id method to attach id number to each word') do
  #   test_word = Word.new({:word => "nature", :definition => []})
  #   expect(test_word.id()).to(eq([1]))
  # end
end
