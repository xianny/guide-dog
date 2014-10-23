class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :activity
      t.belongs_to :user
      t.string :comment
      t.integer :rating
      t.timestamps
    end
  end
end
