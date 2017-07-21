require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/stores' do
  @stores = Store.all()
  erb :stores
end

post '/stores/new' do
  name = params['name']
  store = Store.create({name: name})
  redirect '/stores'
end

get '/stores/:id' do
  @store = Store.find(params['id'].to_i)
  @brands = Brand.all
  erb :store
end

post '/stores/:id/brand' do
  store_id = params['store_id'].to_i
  brand_id = params['brand_id'].to_i
  brand = Brand.find(brand_id)
  @store = Store.find(params['id'].to_i)
  if !@store.brands.include?(brand)
    @store.brands.push(brand)
  end
  redirect "/stores/#{@store.id}"
end

post '/stores/:id/brand/new' do
  name = params['name']
  brand = Brand.create({name: name})
  @store = Store.find(params['id'].to_i)
  @store.brands.push(brand)
  redirect "/stores/#{@store.id}"
end

patch '/stores/:id' do
  @store = Store.find(params['id'].to_i)
  name = params['new_name']
  @store.update({name: name})
  redirect "/stores/#{@store.id}"
end

delete '/stores/:id' do
  @store = Store.find(params['id'].to_i)
  @store.delete
  Brand.all.each { |brand| brand.stores.destroy(@store) }
  redirect '/stores'
end

get '/brands' do
  @brands = Brand.all
  erb :brands
end

post '/brands/new' do
  name = params['name']
  brand = Brand.create({name: name})
  redirect '/brands'
end

get '/brands/:id' do
  @brand = Brand.find(params['id'].to_i)
  @stores = Store.all
  erb :brand
end

post '/brands/:id/store' do
  brand_id = params['brand_id'].to_i
  store_id = params['store_id'].to_i
  store = Store.find(store_id)
  @brand = Brand.find(params['id'].to_i)
  if !@brand.stores.include?(store)
    @brand.stores.push(store)
  end
  redirect "/brands/#{@brand.id}"
end

post '/brands/:id/store/new' do
  name = params['name']
  store = Store.create({name: name})
  @brand = Brand.find(params['id'].to_i)
  @brand.stores.push(store)
  redirect "/brands/#{@brand.id}"
end