class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :band
      t.string :city
      t.string :venue
      t.date :date
      t.float :price
      t.text :description
      t.timestamps null: false
    end
  end
end
