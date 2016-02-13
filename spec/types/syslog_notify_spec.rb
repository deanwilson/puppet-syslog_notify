require 'spec_helper'

describe Puppet::Type.type(:syslog_notify) do
  let(:title) { 'job 32 ran' }

  it 'should have :name as its namevar' do
    expect(described_class.key_attributes).to eq([:name])
  end

  describe 'when validating attributes' do
    [:server, :port, :name].each do |param|
      it "should have a #{param} parameter" do
        expect(described_class.attrtype(param)).to eq(:param)
      end
    end

    [:message].each do |prop|
      it "should have a #{prop} property" do
        expect(described_class.attrtype(prop)).to eq(:property)
      end
    end
  end
end
