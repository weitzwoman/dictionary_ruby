require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#initialize") do
    it('tests for the word method and returns word') do
      test_word = Word.new({:word => "sequioa"})
      expect(test_word.word).to(eq("sequioa"))
    end
    # it('tests for the definition method; initially empty') do
    #   test_word = Word.new({:word => "mountain", :definition => []})
    #   expect(test_word.definition).to(eq([]))
    # end
  end

  describe(".all") do
    it('it is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a word to the array of saved words') do
      test_word = Word.new({:word => "landscape"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it('empties out all of the saved words') do
      Word.new({:word => "landscape"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it('returns a word by its id number') do
      test_word = Word.new({:word => "river"})
      test_word.save()
      test_word2 = Word.new({:word => "granite"})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("#add_definition") do
    it('adds definition to word') do
      test_word = Word.new({:word => "stream"})
      test_definition = Definition.new(:definition => "trickle of water")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

end
