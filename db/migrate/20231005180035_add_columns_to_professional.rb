class AddColumnsToProfessional < ActiveRecord::Migration[7.0]
  def change
    add_column :professionals, :profession, :string
    add_column :professionals, :professional_registration, :string
    add_column :professionals, :specialty, :string
    add_column :professionals, :is_collaborator, :boolean
    add_column :professionals, :is_partner, :boolean
  end
end
