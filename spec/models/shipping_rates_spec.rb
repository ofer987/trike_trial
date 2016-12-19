require 'rails_helper'

RSpec.describe ShippingRates do
  let(:country) { nil }
  subject { described_class.new(currency) }

  context 'for a given country' do
    let(:country) { FactoryGirl.create(:country) }
    let(:currency) do
      FactoryGirl.create(:currency,
                         country: country,
                         regular_shipping_rate: '10.00',
                         express_shipping_rate: '20.00')
    end

    its(:regular) { should eq('10.00') }
    its(:express) { should eq('20.00') }
    its(:as_json) { should eq( { regular: '10.00', express: '20.00' } ) }
  end

  context 'for another country' do
    let(:country) { FactoryGirl.create(:country) }
    let(:currency) do
      FactoryGirl.create(:currency,
                         country: country,
                         regular_shipping_rate: '5.00',
                         express_shipping_rate: '8.00')
    end

    its(:regular) { should eq('5.00') }
    its(:express) { should eq('8.00') }
    its(:as_json) { should eq( { regular: '5.00', express: '8.00' } ) }
  end
end
