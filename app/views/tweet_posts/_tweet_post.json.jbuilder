json.extract! tweet_post, :id, :post, :id_owner, :user_id, :created_at, :updated_at
json.url tweet_post_url(tweet_post, format: :json)
