require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class NutrientTest < Test::Unit::TestCase
  context "Nutrient Model" do
    should 'construct new instance' do
      @nutrient = Nutrient.new
      assert_not_nil @nutrient
    end
  end
end
