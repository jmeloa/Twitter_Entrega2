class CreateTweetPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_posts do |t|
      t.string :post
      t.integer :id_owner
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
