class ChangeStrengthFormatInProficiencies < ActiveRecord::Migration
  def up
    change_column :proficiencies, :strength, :float
  end

  def down
    change_column :proficiencies, :strength, :float
  end
end
