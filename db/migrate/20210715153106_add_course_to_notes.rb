class AddCourseToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :course, null: false, foreign_key: true
  end
end
