class TweetsController < ApplicationController
	
	def new
		@tweet = Tweet.new 
		@user = User.new
	end
	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			redirect_to @tweet
		else
			render :new
		end
	end
	
	def index
		@tweets = Tweet.all 
	end
	def show
		@tweet = Tweet.find(params[:id])
		@comments = @tweet.comments.all
	end
	def edit
		@tweet = Tweet.find(params[:id]) 
	end
	def update
		@tweet = Tweet.find(params[:id])
		@tweet.update(tweet_params)
		redirect_to @tweet
	end
	def destroy	
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to tweets_path
	end
	
	private
	def tweet_params 
		params.require(:tweet).permit(:message,:title, :user_id) #parametes form
	end

end

