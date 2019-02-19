class AddTransactionDetailsToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :quantity, :integer
    add_column :transactions, :needs_return, :boolean
    add_column :transactions, :due_date, :datetime
    add_column :transactions, :returned_date, :datetime
  end
end
