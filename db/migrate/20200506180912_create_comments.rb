class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.references :comment, index: true, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
