class RemoveVolunteers < ActiveRecord::Migration[7.0]
  def change
    drop_table :volunteers
  end
end
