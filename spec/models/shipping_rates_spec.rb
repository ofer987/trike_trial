require 'rails_helper'

RSpec.describe ShippingRates do
  context 'for a given country' do
    let!(:country) { FactoryGirl.create(:country) }
    let!(:currency) do
      FactoryGirl.create(:currency,
                         country: country,
                         regular_shipping_rate: '10.00',
                         express_shipping_rate: '20.00')
    end

    subject { described_class.new(currency) }

    its(:regular) { should eq('10.00') }
    its(:express) { should eq('20.00') }
    its(:as_json) { should eq( { regular: '10.00', express: '20.00' } ) }

    context 'for another country' do
      let!(:another_country) { FactoryGirl.create(:country) }
      let!(:another_currency) do
        FactoryGirl.create(:currency,
                           country: another_country,
                           regular_shipping_rate: '5.00',
                           express_shipping_rate: '8.00')
      end

      subject { described_class.new(another_currency) }

      its(:regular) { should eq('5.00') }
      its(:express) { should eq('8.00') }
      its(:as_json) { should eq( { regular: '5.00', express: '8.00' } ) }

      context 'for another currency' do
        let!(:funny_money) do
          FactoryGirl.create(:currency,
                             country: another_country,
                             regular_shipping_rate: '125.25',
                             express_shipping_rate: '599.99')
        end

        subject { described_class.new(funny_money) }

        its(:regular) { should eq('125.25') }
        its(:express) { should eq('599.99') }

        its(:as_json) { should eq( { regular: '125.25', express: '599.99' } ) }
      end
    end
  end
end
