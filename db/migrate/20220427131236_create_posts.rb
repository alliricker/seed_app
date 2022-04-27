class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.float :rating, null: false 
      t.string :notes 
    end
  end
end
