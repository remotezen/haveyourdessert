require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class SessionsTest < Test::Unit::TestCase
  context "Sessions Model" do
    should 'construct new instance' do
      @sessions = Sessions.new
      assert_not_nil @sessions
    end
  end
end
