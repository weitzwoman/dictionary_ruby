require('rspec')
require('word')
# require('definition')

describe(Word) do
  describe("#initialize") do
    it('tests for the word method and return word') do
      test_word = Word.new({:word => "sequioa", :definition => "redwood tree"})
      expect(test_word.word).to(eq("sequioa"))
    end
  end
end
