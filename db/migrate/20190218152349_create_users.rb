class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :image_url
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :level

      t.timestamps
    end
  end
end
