class CreateSessions < ActiveRecord::Migration[6.0]
  def up
    create_table :sessions do |t|
      t.text :location, null: false
      t.text :description
      t.text :business_address

      t.belongs_to :project

      t.timestamps
    end
  end

  def down
    drop_table :sessions
  end
end
