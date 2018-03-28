class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :objective
      t.string :description
      t.string :instructor

      t.timestamps
    end
  end
end
