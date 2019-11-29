class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :description
      t.float :rating
      t.text :review

      t.timestamps
    end
  end
end
