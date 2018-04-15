class AddDiscussionIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :discussion_id, :integer
  end
end
