require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class Blog::App::NutrientsHelperTest < Test::Unit::TestCase
  context "Blog::App::NutrientsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend Blog::App::NutrientsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
