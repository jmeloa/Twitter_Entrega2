class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Tweet_Post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
