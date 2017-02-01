class CreateHappyMoneyCurrencies < ActiveRecord::Migration
  def change
    create_table :happy_money_currencies do |t|
      t.string :iso_code
      t.string :iso_number
      t.string :name
      t.string :symbol

      t.timestamps null: false
    end
  end
end
