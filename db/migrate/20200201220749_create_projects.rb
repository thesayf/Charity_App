class CreateProjects < ActiveRecord::Migration[6.0]
  def up
    create_table :projects do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.string :longitude
      t.string :latitude
      t.string :project_type

      t.belongs_to :charity

      t.timestamps
    end
  end

  def down
    drop_table :projects
  end
end
