class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :zipcode
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :address_map
      t.string :complement
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
