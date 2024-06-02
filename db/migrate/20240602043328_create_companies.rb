class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :category
      t.string :zipcode
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end
