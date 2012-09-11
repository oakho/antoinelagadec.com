require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class TagTest < Test::Unit::TestCase
  context "Tag Model" do
    should 'construct new instance' do
      @tag = Tag.new
      assert_not_nil @tag
    end
  end
end
