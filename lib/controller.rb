require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'],params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show, locals: { gossip: Gossip.find_by_id(params['id'].to_i), id: params['id'] }
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: { id: params['id'] }
  end

  post '/gossips/:id/edit' do
    Gossip.edit("#{params["gossip_author_edit"]}", "#{params["gossip_content_edit"]}", "#{params['id']}")
    redirect "/gossips/#{params['id']}/"
  end
end