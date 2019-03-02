class CreateHomies < ActiveRecord::Migration[5.2]
  def change
    create_table :homies do |t|
      t.string :name
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
