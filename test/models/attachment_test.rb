require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class AttachmentTest < Test::Unit::TestCase
  context "Attachment Model" do
    should 'construct new instance' do
      @attachment = Attachment.new
      assert_not_nil @attachment
    end
  end
end
