class CreateHappyMoneyMoney < ActiveRecord::Migration
  def change
    create_table :happy_money_money do |t|
      t.float :amount
      t.string :currency

      t.timestamps null: false
    end
  end
end
