class CreateTips < ActiveRecord::Migration[6.1]
  def change
    create_table :tips do |t|
      t.text :tip
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :trick, null: false, foreign_key: true

      t.timestamps
    end
  end
end
