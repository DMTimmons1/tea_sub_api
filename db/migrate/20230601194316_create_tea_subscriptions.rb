class CreateTeaSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :tea_subscriptions do |t|
      t.references :subscription, foreign_key: true
      t.references :tea, foreign_key: true
      t.timestamps
    end
  end
end
