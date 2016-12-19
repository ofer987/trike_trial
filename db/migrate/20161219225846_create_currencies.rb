CURRENCY_MAPPING = {
  "AU" => {
    name: "Australian Dollar",
    code: "AUD"
  },
  "US" => {
    name: "United States Dollar",
    code: "USD"
  }
}

class CreateCurrencies < ActiveRecord::Migration
  def up
    create_table :currencies do |t|
      t.references :country, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.string :code, null: false
      t.string :regular_shipping_rate, null: false
      t.string :express_shipping_rate, null: false

      t.timestamps null: false

      t.index [:country_id, :code], unique: true
    end

    Country.all.each do |country|
      mapping = CURRENCY_MAPPING[country.code]

      Currency.create!(country: country,
                       name: mapping[:name],
                       code: mapping[:code],
                       regular_shipping_rate: country.regular_shipping_rate,
                       express_shipping_rate: country.express_shipping_rate)
    end

    remove_column :countries, :regular_shipping_rate
    remove_column :countries, :express_shipping_rate
  end

  def down
    add_column :countries, :regular_shipping_rate, :string
    add_column :countries, :express_shipping_rate, :string

    Country.all.each do |country|
      mapping = CURRENCY_MAPPING[country.code.to_s]
      currency = country.currencies.where(code: mapping[:code]).first

      country.update!(regular_shipping_rate: currency.regular_shipping_rate,
                      express_shipping_rate: currency.express_shipping_rate)
    end

    drop_table :currencies
  end
end
