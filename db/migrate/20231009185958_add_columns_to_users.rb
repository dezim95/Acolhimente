class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profession, :string
    add_column :users, :professional_registration, :string
    add_column :users, :specialty, :string
  end
end
