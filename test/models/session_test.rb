require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class SessionTest < Test::Unit::TestCase
  context "Session Model" do
    should 'construct new instance' do
      @session = Session.new
      assert_not_nil @session
    end
  end
end
