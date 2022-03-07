class TweetsController < ApplicationController
    
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new #form_withから送られてきた情報が＠tweet（インスタンス）を作ってcreateアクションに渡される
    end
    
    def create
        Tweet.create(tweet_params)
    end 
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
    end 
    
    
    private
    
    def tweet_params
        # params.require(:tweet).permit(:name, :image, :text)
        params.require(:tweet).permit(:name, :image, :text)
    end 
    
end
