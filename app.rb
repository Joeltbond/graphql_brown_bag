require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'rack/contrib'

require_relative 'models/speaker'
require_relative 'graphql/schema'

# A Microservice for scheduling Brown Bags
class BrownBagApp < Sinatra::Base
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

  get '/' do
    content_type :html
    erb :graphiql
  end

  get '/speakers' do
    @speakers = Speaker.all
    json @speakers
  end

  post '/speakers' do
    @speaker = Speaker.create(
      name: params[:name],
      talk_title: params[:talk_title]
    )
    json @speaker
  end

  get '/speakers/:id' do |id|
    @speaker = Speaker.find(id)
    json @speaker
  end

  post '/graphql' do
    result = BrownBagAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil }
    )
    json result
  end
end
