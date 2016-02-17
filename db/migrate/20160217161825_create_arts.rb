class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
