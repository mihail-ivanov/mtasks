class CreateMtasks < ActiveRecord::Migration
  def change
    create_table :mtasks do |t|
      t.string :text
      t.integer :author_id
      t.integer :assigned_to_id
      t.integer :project_id
      t.date :due_date
      t.boolean :finished, null: false, default: false

      t.timestamps null: false
    end
  end
end
