class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.belongs_to :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
