class OrdersController < ApplicationController
# index

get "/orders" do
  @orders = Order.all
  erb :index
end

# new
get "/orders/new" do
  @order = Order.new
  erb :new
end

# create
post "/orders" do
  @order = Order.create(params[:title])
  redirect "/orders/#{ @order.id }"
end

# show
get "/orders/:id" do
  @order = Order.find(params[:id])
  @sage = Sage.find(params[:id])
  erb :show
end

# edit
get "/orders/:id/edit" do
  @order = Order.find(params[:orders_id])
  erb :edit
end

# update
patch "/orders/:id" do
  @order = Order.find(params[:orders_id])
  @order.update(params[:order])
  redirect  "/orders/#{ @order.id }"
end

#destroy
delete "/orders/:id" do
  Order.destroy(params[:id])
  redirect "/orders"
end
end
