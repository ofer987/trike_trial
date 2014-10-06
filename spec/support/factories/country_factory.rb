FactoryGirl.define do

  factory :country do
    name                  { Faker::Address.country }
    code                  { Faker::Address.country_code(name) }
    regular_shipping_rate { (rand(100) + 10).to_s }
    express_shipping_rate { (rand(100) + 10).to_s }
  end

end
