class TweetsController < ApplicationController
    
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new #form_withから送られてきた情報が＠tweet（インスタンス）を作ってcreateアクションに渡される
    end
    
    def create(tweet_params)
    end 
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
    
    private
    
    def tweet_params
        params.require(:Tweet).parmit(:mane, :image, :text)
    end 
    
end
