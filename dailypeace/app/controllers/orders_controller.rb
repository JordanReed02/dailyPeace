class OrdersController < ApplicationController
# index

get "/orders" do
  @orders = Order.all
  erb :index
end

# new
get "/orders/new" do
  redirect_if_not_logged_in
  @order = Order.new
  erb :new
end

# create
post "/orders" do
  redirect_if_not_logged_in
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
  redirect_if_not_authorized
  erb :edit
end

# update
patch "/orders/:id" do
  @order = Order.find(params(title: params[:id]))
if  @order.update(title: params[:id])
  flash[:success] = "The Sage understands"
  redirect  "/orders/#{ @order.id }"
else
  erb :edit
  end
end
#destroy
 delete "/orders/:id" do
    redirect_if_not_authorized
    @order.destroy
  redirect "/orders"
      end

      private

      def redirect_if_not_authorized
        redirect_if_not_logged_in
        if !authorize_order(@order)
          redirect '/orders'
        end
      end

      def authorize_order(order)
        current_user == order.user
      end

    end
