ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/links/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each { |tag| link.tags << Tag.create(name: tag) }
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/user/new' do
    erb :'links/user'
  end

  get '/user' do
    @user = session[:name]
    p params[:name]
    erb :'links/welcome'
  end

  post '/user' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    user.save
    session[:name] = params[:name]
    redirect '/user'
  end

  run! if app_file == $0
end
