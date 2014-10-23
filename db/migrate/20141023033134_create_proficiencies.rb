class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.integer    :strength
      t.belongs_to :user
      t.belongs_to :tag
      t.timestamps
    end
  end
end
