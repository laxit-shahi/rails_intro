class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    # id is auto added as primary key
    create_table :articles do |t|
      t.string :title
      t.text :body

      # defines two cols: created_at and updated_at
      t.timestamps
    end
  end
end
