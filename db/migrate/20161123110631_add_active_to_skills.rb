class AddActiveToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :active, :boolean, default: true
  end
end
