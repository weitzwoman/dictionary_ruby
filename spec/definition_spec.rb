require('rspec')
require('definition')

describe(Definition) do
  describe("#initialize") do
    it('tests for the definiton method and returns definition') do
      test_definition = Definition.new({:definition => "running water"})
      expect(test_definition.definition).to(eq("running water"))
    end
  end

end
