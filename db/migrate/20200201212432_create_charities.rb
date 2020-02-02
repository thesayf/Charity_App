class CreateCharities < ActiveRecord::Migration[6.0]
  def up
    create_table :charities do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.text :business_address
      t.belongs_to :admin

      t.timestamps
    end
  end

  def down
    drop_table :charities
  end
end
