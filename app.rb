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
   @post = Content.new
   erb :form_new
end

get '/index' do
   @posts = Content.all.reverse #新しい順番で
   erb :index
end

post '/create_post' do
   name = params[:name]
   email = params[:email]
   title = params[:title]
   content = params[:content]
   password = params[:password]
   time = Time.now()
   @post = Content.new(name: name,email: email,title: title,content: content,time: time,passowrd: passowrd)
   if @post.save
      redirect :index
   else 
      erb :form_new
   end
end

get '/show/:id' do
   id = params[:id]
   @post = Content.find_by(id: id)
   #文字列を整形
   contents_length = @post.content.chars
   @contents = contents_length.each_slice(65).to_a
   erb :show
end


post '/destory/:post_id' do 
   post_id = params[:post_id]
   @post = find_by(id: post_id)
end