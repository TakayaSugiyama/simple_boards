require 'rubygems'
require 'bundler'
Bundler.require
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "content.sqlite3"}

get '/' do
    erb :home
end

get '/form_new' do
   erb :form_new
end

post '/create_post' do
   redirect '/'
end