require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class Blog::App::BasesHelperTest < Test::Unit::TestCase
  context "Blog::App::BasesHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend Blog::App::BasesHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
