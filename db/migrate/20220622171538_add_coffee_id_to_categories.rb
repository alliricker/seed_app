class AddCoffeeIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :coffee_id, :integer
  end
end
