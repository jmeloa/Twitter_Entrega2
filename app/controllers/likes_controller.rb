class LikesController < ApplicationController
  before_action :find_post
  before_action :set_like, only: %i[ show edit update destroy ]
  


  # GET /likes or /likes.json
  
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  
  def create
  #    @tweet_post.likes.create(User_id: current_user.id)
   #@like = Like.new(:current_user.id, :tweet_post_id)
   
   @like = Like.create(User_id: current_user.id, Tweet_Post_id: :tweet_post_id)
   
   
   redirect_to tweet_posts_path
      
  end  
      


  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = current.user.likes.find(params[:id]) 
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #def like_params
    #  params.require(:like).permit(:User_id, :tweet_id)
    #end

    def find_post
      @tweet_post = TweetPost.find(params[:tweet_post_id])
    end
    #def like_params
      
    #  params.require(:like).permit(:current_user.id, :tweet_post_id)
    
    #end

    
end
