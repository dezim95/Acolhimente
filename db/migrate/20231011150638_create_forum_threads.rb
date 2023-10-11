class CreateForumThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_threads do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
