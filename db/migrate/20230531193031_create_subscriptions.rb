class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.string :title
      t.integer :price
      t.string :status
      t.string :frequencey
      
      t.timestamps
    end
  end
end
