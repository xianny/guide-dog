class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.string :title
      t.boolean :at_home
      t.boolean :social
      t.integer :cost
      t.string :location
      t.string :content
      t.timestamps
    end
  end
end
