require "test_helper"

class TweetPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet_post = tweet_posts(:one)
  end

  test "should get index" do
    get tweet_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_tweet_post_url
    assert_response :success
  end

  test "should create tweet_post" do
    assert_difference('TweetPost.count') do
      post tweet_posts_url, params: { tweet_post: { id_owner: @tweet_post.id_owner, post: @tweet_post.post, user_id: @tweet_post.user_id } }
    end

    assert_redirected_to tweet_post_url(TweetPost.last)
  end

  test "should show tweet_post" do
    get tweet_post_url(@tweet_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_tweet_post_url(@tweet_post)
    assert_response :success
  end

  test "should update tweet_post" do
    patch tweet_post_url(@tweet_post), params: { tweet_post: { id_owner: @tweet_post.id_owner, post: @tweet_post.post, user_id: @tweet_post.user_id } }
    assert_redirected_to tweet_post_url(@tweet_post)
  end

  test "should destroy tweet_post" do
    assert_difference('TweetPost.count', -1) do
      delete tweet_post_url(@tweet_post)
    end

    assert_redirected_to tweet_posts_url
  end
end
