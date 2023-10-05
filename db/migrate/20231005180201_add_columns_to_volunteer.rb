class AddColumnsToVolunteer < ActiveRecord::Migration[7.0]
  def change
    add_column :volunteers, :profession, :string
    add_column :volunteers, :professional_registration, :string
    add_column :volunteers, :specialty, :string
  end
end
