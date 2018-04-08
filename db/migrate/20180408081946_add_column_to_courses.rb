class AddColumnToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :length, :string
    add_column :courses, :effort, :string
    add_column :courses, :price, :string
    add_column :courses, :institution, :string
    add_column :courses, :level, :string
    add_column :courses, :languages, :string
    add_column :courses, :videots, :string
    add_column :courses, :prerequisites, :string
  end
end
