ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/link'
require_relative './app/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
  link = Link.new(url: params[:url],
                title: params[:title])
  tag  = Tag.first_or_create(name: params[:tags])
  link.tags << tag
  link.save                   
  redirect to('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
