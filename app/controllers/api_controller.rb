class ApiController < ActionController::API
  
  def create_tweet
      
      @user = User.find_by(email: request.headers["X-EMAIL"]) 
      if @user.present?
        @tweet = TweetPost.new(post: request.headers["X-TWEET"], user_id: @user.id, id_owner: @user.id)
                
        if @tweet.save
           render json: @tweet
        else  
           render json: 'No se pudo guardar'    
        end
      else
          render json: 'No encontré usuario'    
      end

      
  end
  
  
  def news
    @tweet_posts = TweetPost.all.order(id: :desc).limit(50) 
    tweets_array = []
    @tweet_posts.each do |tweet|
      tweets_hash = {
        :id => tweet.id,
        :content => tweet.post,
        :user_id => tweet.user_id,
        :like_count => 3   ,
        :retweet_count =>   2 ,
        :retweeted_from => tweet.id_owner  

      }
      #tweets_array << tweets_hash  
      tweets_array.push tweets_hash  
    end
    
    #render json: @tweet_posts
    render json: tweets_array
  end


  def search
    fecha1 = params[:fecha1].to_date
    fecha2 = params[:fecha2].to_date + 1.days
    @tweets = TweetPost.where(created_at: fecha1..fecha2)
    render json: @tweets    
  end
end
