require 'spec_helper'

describe MainsmsApi::Message do
  let(:sign)  { '12cb0a07a49b60222158b504bee88f57' }
  let(:query) { 'message=test&project=mainsms&recipients=89121231234&sender=mainsms.ru&sign=12cb0a07a49b60222158b504bee88f57' }

  subject { MainsmsApi::Message.new(sender: 'mainsms.ru', message: 'test', recipients: ['89121231234']) }

  before { MainsmsApi::Configuration.setup(project: 'mainsms', api_key: '07349e954831d') }

  describe '#sign' do
    its(:sign) { should == sign }
  end

  describe '#query' do
    its(:query) { should == query }
  end
end
