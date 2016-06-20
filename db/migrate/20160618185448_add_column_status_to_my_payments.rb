class AddColumnStatusToMyPayments < ActiveRecord::Migration
  def change
    add_column :my_payments, :status, :string
  end
end
