class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
