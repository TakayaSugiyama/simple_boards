require 'rubygems'
require 'bundler'
Bundler.require
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "contents.sqlite3"}
class Content < ActiveRecord::Base
   validates_presence_of :name
   validates_presence_of :email
   validates_presence_of :title
   validates_presence_of :content
end

get '/' do
    erb :home
end

get '/form_new' do
   erb :form_new
end

get '/index' do
   @posts = Content.all
   erb :index
end

post '/create_post' do
   name = params[:name]
   email = params[:email]
   title = params[:title]
   content = params[:content]
   @post = Content.new(name: name,email: email,title: title,content: content)
   if @post.save
      redirect :index
   else 
      redirect :form_new
   end
end
