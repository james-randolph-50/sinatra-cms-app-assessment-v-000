class AddColumnToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :email, :string
    end
  end
end