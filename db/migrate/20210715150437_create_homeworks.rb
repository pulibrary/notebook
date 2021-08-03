class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.text :entry, null: false
      t.datetime :due_at, null: false

      t.timestamps
    end
  end
end
