class AddKanaColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    if Spree.user_class.present?
      users_table_name = Spree.user_class.table_name
      add_column users_table_name, :firstname_kana, :string unless column_exists?(users_table_name, :firstname_kana)
      add_column users_table_name, :lastname_kana, :string unless column_exists?(users_table_name, :lastname_kana)
    end

    add_column 'spree_addresses', :firstname_kana, :string unless column_exists?('spree_addresses', :firstname_kana)
    add_column 'spree_addresses', :lastname_kana, :string unless column_exists?('spree_addresses', :lastname_kana)
  end
end
