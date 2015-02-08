require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
    # tweet1 = Tweet.new("Danny","Hello")
    # tweet2 = Tweet.new("bob","Hello")
    # tweet3 = Tweet.new("fkljsnfk","Hello")

    @tweets = Tweet.all_messages

    erb :tweets
  end

  post '/tweets' do
    # puts params
    # binding.pry
    new_tweet = Tweet.new(params[:user],params[:message])
    redirect('/')
  end

end