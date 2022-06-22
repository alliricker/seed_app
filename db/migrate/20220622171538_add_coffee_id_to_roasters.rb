class AddCoffeeIdToRoasters < ActiveRecord::Migration[6.0]
  def change
    add_column :roasters, :coffee_id, :integer
  end
end
