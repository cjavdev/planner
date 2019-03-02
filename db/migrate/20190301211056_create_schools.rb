class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.integer :region_id
      t.string :students_per_teacher
      t.string :grades
      t.string :size
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :gs_rating
      t.string :school_type
      t.integer :gs_school_id

      t.timestamps
    end
  end
end
