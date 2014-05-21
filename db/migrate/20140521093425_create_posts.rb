class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :poster
      t.integer :comment_id

      t.timestamps
    end
  end
end
