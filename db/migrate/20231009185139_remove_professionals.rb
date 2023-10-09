class RemoveProfessionals < ActiveRecord::Migration[7.0]
  def change
    drop_table :professionals
  end
end
