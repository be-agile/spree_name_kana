class AddKanaColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lastname_kana, :string
    add_column :users, :firstname_kana, :string
  end
end
