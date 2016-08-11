class CommentsController < ApplicationController
	def new 
        @tweet= Tweet.find(params[:tweet_id])
        @comment= @tweet.comments.new
    end
    def create 
        @tweet= Tweet.find(params[:tweet_id])
        comment=@tweet.comments.new(comment_params)
        comment.save
        redirect_to tweet_path(@tweet)
    end


    private

    def comment_params
        params.require(:comment).permit(:id,:content,:tweet_id)
    end

end
