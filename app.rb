require 'rubygems'
require 'bundler'
Bundler.require

get '/' do
    erb :home
end

get '/form_new' do
   erb :form_new
end