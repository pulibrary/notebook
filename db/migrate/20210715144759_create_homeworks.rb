class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|

      t.timestamps
    end
  end
end
