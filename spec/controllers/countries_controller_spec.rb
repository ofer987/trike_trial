require "rails_helper"

describe CountriesController do

  describe "shipping_rates" do
    let(:code)           { "AU" }
    let!(:country)       { FactoryGirl.create :country, :code => code }
    before(:each)        { FactoryGirl.create :country, :code => "US" }

    subject(:shipping_rates) { get :shipping_rates, :country_code => code, :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do
      subject(:response_body) { shipping_rates; JSON.parse(response.body) }

      specify { expect(response_body["regular"]).to eq country.regular_shipping_rate }
      specify { expect(response_body["express"]).to eq country.express_shipping_rate }
    end

  end

end
