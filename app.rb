require 'rubygems'
require 'bundler'
Bundler.require
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "contents.sqlite3"}
class Content < ActiveRecord::Base
   validates_presecne_of :name
   validates_presecne_of :email
   validates_presecne_of :title
   validates_presecne_of :content
end

get '/' do
    erb :home
end

get '/form_new' do
   erb :form_new
end

post '/create_post' do
   redirect '/'
end