class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :bid
      t.string :label
      t.integer :abv
      t.integer :ibu
      t.string :description
      t.string :slug
      t.string :style
      t.integer :rating
      t.string :brewery_name
      t.string :brewery_state

      t.timestamps
    end
  end
end
