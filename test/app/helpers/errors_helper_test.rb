require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class Blog::App::ErrorsHelperTest < Test::Unit::TestCase
  context "Blog::App::ErrorsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend Blog::App::ErrorsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
