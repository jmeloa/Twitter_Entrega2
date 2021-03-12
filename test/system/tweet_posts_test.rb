require "application_system_test_case"

class TweetPostsTest < ApplicationSystemTestCase
  setup do
    @tweet_post = tweet_posts(:one)
  end

  test "visiting the index" do
    visit tweet_posts_url
    assert_selector "h1", text: "Tweet Posts"
  end

  test "creating a Tweet post" do
    visit tweet_posts_url
    click_on "New Tweet Post"

    fill_in "Id owner", with: @tweet_post.id_owner
    fill_in "Post", with: @tweet_post.post
    fill_in "User", with: @tweet_post.user_id
    click_on "Create Tweet post"

    assert_text "Tweet post was successfully created"
    click_on "Back"
  end

  test "updating a Tweet post" do
    visit tweet_posts_url
    click_on "Edit", match: :first

    fill_in "Id owner", with: @tweet_post.id_owner
    fill_in "Post", with: @tweet_post.post
    fill_in "User", with: @tweet_post.user_id
    click_on "Update Tweet post"

    assert_text "Tweet post was successfully updated"
    click_on "Back"
  end

  test "destroying a Tweet post" do
    visit tweet_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tweet post was successfully destroyed"
  end
end
