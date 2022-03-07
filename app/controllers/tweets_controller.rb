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
    
    def edit
        @tweet = Tweet.find(params[:id])
    end 
    
    def update
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params)
    private
    
    def tweet_params
        # params.require(:tweet).permit(:name, :image, :text)
        params.require(:tweet).permit(:name, :image, :text)
    end 
    
end
