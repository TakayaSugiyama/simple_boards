class AddPasswordColumnToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents,:password,:string
  end
end
