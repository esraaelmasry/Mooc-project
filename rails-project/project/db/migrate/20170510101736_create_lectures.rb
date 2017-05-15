class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :content
      t.string :attatchment
      t.references :course {on_delete: :cascade}

      t.timestamps
    end
  end
end
