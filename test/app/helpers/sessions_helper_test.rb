require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class Blog::App::SessionsHelperTest < Test::Unit::TestCase
  context "Blog::App::SessionsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend Blog::App::SessionsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
