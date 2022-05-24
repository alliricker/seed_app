class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :coffees
  end
end
