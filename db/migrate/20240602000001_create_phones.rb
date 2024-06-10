class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :type
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
