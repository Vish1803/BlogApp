class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.belongs_to :post, index: true
      t.string :title

      t.timestamps
    end
  end
end
