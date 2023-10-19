class AddRatingToRestaurants < ActiveRecord::Migration[7.0]
  def change
    # add_column :table_name, :column_name, :data_type, default: 0
    # Restaurant.all.each do |restaurant|
    #   restaurant.new_column = restaurant.old_column
    #   restaurant.save
    # end
    # remove_column :table_name, :column_name, :data_type, default: 0
    add_column :restaurants, :rating, :integer, default: 0
  end
end
