class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :email
      t.text :title
      t.text :content
    end
  end
end
