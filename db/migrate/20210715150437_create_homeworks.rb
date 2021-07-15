class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.text :entry
      t.datetime :due_at

      t.timestamps
    end
    belongs_to :course
  end
end
