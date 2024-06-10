class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    create_table :phones do |t|
      t.integer :phone_type
      t.string :phone_number
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
