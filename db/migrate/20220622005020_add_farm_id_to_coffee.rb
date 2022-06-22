class AddFarmIdToCoffee < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :farm_id, :integer
  end
end
