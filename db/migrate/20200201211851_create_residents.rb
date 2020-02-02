class CreateResidents < ActiveRecord::Migration[6.0]
  def up
    create_table :residents do |t|

      t.string :name, null: false, index: { unique: true }
      t.string :email, index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end

  def down
    drop_table :residents
  end
end
