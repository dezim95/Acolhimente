class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end