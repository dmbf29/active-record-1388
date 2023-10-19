class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      # specify what the table has
      # t.data_type :column_name
      t.string :name
      t.string :address

      t.timestamps # this adds created_at and updated_at
    end
  end
end
