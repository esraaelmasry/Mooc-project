class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :dob
      t.string :gender
      t.string :profilepicture

      t.timestamps
    end
  end
end
