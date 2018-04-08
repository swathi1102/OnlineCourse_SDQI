class CreatePdfdocs < ActiveRecord::Migration[5.1]
  def change
    create_table :pdfdocs do |t|
      t.string :name
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
