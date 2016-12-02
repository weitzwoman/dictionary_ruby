require('rspec')
require('word')
# require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

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

  describe("#save") do
    it('adds a word to the array of saved words') do
      test_word = Word.new({:word => "landscape", :definition => []})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it('empties out all of the saved words') do
      Word.new({:word => "landscape", :definition => []}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  # it('tests for the id method to attach id number to each word') do
  #   test_word = Word.new({:word => "nature", :definition => []})
  #   expect(test_word.id()).to(eq([1]))
  # end
end
