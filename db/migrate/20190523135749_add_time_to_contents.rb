class AddTimeToContents < ActiveRecord::Migration[5.2]
  def change
     add_column :contents, :time, :string
  end
end
