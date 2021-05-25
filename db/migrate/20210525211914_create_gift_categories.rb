class CreateGiftCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :gift_categories do |t|
      t.references :gift, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
