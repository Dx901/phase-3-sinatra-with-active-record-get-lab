class ApplicationController < Sinatra::Base

  # add routes

  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(:include => :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.most_expensive
    baked_good.to_json
  end

end



# get '/games' do
#   # get all the games from the database
#   games = Game.all
#   # return a JSON response with an array of all the game data
#   games.to_json
# end