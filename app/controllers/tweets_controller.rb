class TweetsController < ApplicationController
    before_action :set_tweet, only: [:edit, :show]
    before_action :move_to_index, except: [:index, :show]
    
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
        # @tweet = Tweet.find(params[:id])
    end 
    
    def update
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params)
    end
    
    def show
        # @tweet = Tweet.find(params[:id])
    end
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:name, :image, :text)
    end 
    
    def set_tweet
        @tweet = Tweet.find(params[:id])
    end 
    
    def move_to_index
        unless user_signed_in?
            redirect_to action: :index
        end 
    end
        
end
