class AddLevelsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :levels, :string
  end
end
