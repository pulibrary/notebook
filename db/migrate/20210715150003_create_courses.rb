class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name

      t.timestamps
    end
    belongs_to :subject
    has_many :notes, dependent: :destroy
    has_many :homeworks, dependent: :destroy
  end
end
