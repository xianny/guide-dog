class ChangeStrengthFormatInRelevances < ActiveRecord::Migration
  def up
    change_column :relevances, :strength, :float
  end

  def down
    change_column :relevances, :strength, :float
  end
  
end
