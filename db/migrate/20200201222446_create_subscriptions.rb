class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def up
    create_table :subscriptions do |t|
      t.belongs_to :project
      t.belongs_to :resident
      t.timestamps
    end
  end

  def down
    drop_table :subscriptions
  end
end
