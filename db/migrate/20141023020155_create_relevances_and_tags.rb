class CreateRelevancesAndTags < ActiveRecord::Migration
  def change
    create_table :relevances do |t|
      t.belongs_to :activity
      t.belongs_to :tag
      t.integer    :strength
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

  end
end
