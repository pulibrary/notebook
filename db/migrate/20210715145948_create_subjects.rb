class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name

      t.timestamps
    end
    has_many :courses, dependent: :destroy
  end
end
