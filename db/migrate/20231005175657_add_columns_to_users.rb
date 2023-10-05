class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :instagram, :string
  end
end
