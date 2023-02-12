class CreateRealEstates < ActiveRecord::Migration[7.0]
  def change
    create_table :real_estates do |t|
      t.references :agency, null: false, foreign_key: true
      t.string :link
      t.decimal :price
      t.integer :transaction_type
      t.integer :house_type
      t.string :street, null: true
      t.string :number, null: true
      t.string :district, null: true
      t.string :city, null: true
      t.string :state, null: true
      t.text :phones, array: true, default: []
      t.json :traits, null: true
      t.text :description, null: true
      t.text :extra, array: true, default: []

      t.timestamps
    end
  end
end
