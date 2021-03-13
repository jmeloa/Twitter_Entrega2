class TweetPostsController < ApplicationController
  before_action :set_tweet_post, only: %i[ show edit update destroy ]

  # GET /tweet_posts or /tweet_posts.json
  def index
    friends = Friend.where("user_id=?" , current_user&.id)
    
    #obtengo los amigos del usuario
    aux2 = friends.pluck :friend_id
    #saco los twitter de los amigos
    if params[:content].present?
      aux = TweetPost.where(user_id: aux2)
      aux2 = aux.where("post LIKE ?", "%#{params[:content]}%")
      
      @tweet_posts = aux2.order("created_at DESC").page(params[:page]).per_page(50)
    else
      aux = TweetPost.where(user_id: aux2)
      @tweet_posts = aux.order("created_at DESC").page(params[:page]).per_page(50)
    end
    
    # @tweet_posts = TweetPost.order("created_at DESC").page(params[:page]).per_page(5)
  end

  # GET /tweet_posts/1 or /tweet_posts/1.json
  def show
    
  end

  # GET /tweet_posts/new
  def new
    @tweet_post = TweetPost.new
  end

  
  # GET /tweet_posts/1/edit
  def edit
  end

  # POST /tweet_posts or /tweet_posts.json
  def create
    @tweet_post = TweetPost.new(tweet_post_params)

    respond_to do |format|
      if @tweet_post.save
        format.html { redirect_to @tweet_post, notice: "Tweet post was successfully created." }
        format.json { render :show, status: :created, location: @tweet_post }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet_post.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /tweet_posts/1 or /tweet_posts/1.json
  def update
    respond_to do |format|
      if @tweet_post.update(tweet_post_params)
        format.html { redirect_to @tweet_post, notice: "Tweet post was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet_post }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet_post.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /tweet_posts/1 or /tweet_posts/1.json
  def destroy
    @tweet_post.destroy
    respond_to do |format|
      format.html { redirect_to tweet_posts_url, notice: "Tweet post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_post
      @tweet_post = TweetPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_post_params
      params.require(:tweet_post).permit(:post, :id_owner, :user_id)
    end
end
