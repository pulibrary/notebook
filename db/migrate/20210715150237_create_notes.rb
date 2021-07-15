class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :entry

      t.timestamps
    end
    belongs_to :course
  end
end
