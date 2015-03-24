require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class FoodcompTest < Test::Unit::TestCase
  context "Foodcomp Model" do
    should 'construct new instance' do
      @foodcomp = Foodcomp.new
      assert_not_nil @foodcomp
    end
  end
end
