require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#initialize") do
    it('tests for the definiton method and returns definition') do
      test_definition = Definition.new({:definition => "running water"})
      expect(test_definition.definition).to(eq("running water"))
    end
  end

  describe(".all") do
    it('it is empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a definition') do
      test_definition = Definition.new({:definition => "large natural elevation rising arruptly"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it('empties out all of the saved definitions') do
      Definition.new({:definition => "grassy knoll"}).save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

end
