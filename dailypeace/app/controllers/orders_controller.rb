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
  @order = Order.find(params[:id])
  erb :edit
end

# update
patch "/orders/:id" do
  @order = Order.find(params[:orders_id])
if  @order.update(title: params[:orders_id])
  flash[:success] = "The Sage understands"
  redirect  "/orders/#{ @order.id }"
else
  erb :edit
  end
end
#destroy
delete "/orders/delete" do
  connection.execute("DELETE FROM orders WHERE orders.id = ?", params['id'])
  if @order.nil?
    flash[:error] = "Could not change Request"
    Order.delete
  redirect "/orders"
      end
    end
  end
