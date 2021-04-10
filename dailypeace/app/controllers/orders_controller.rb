class OrdersController < ApplicationController
# index
  get "/orders" do
    @articles = Article.all
    erb :index
  end

  # new
  get "/orders/new" do
    @order = Order.new
    erb :new
  end

  # create
  post "/orders" do
    @article = Article.create(params)
    redirect to "/orders/#{ @order.id }"
  end

  # show
  get "/orders/:id" do
    @article = Order.find(params[:id])
    erb :show
  end

  # edit
  get "/orders/:id/edit" do
    @order = Order.find(params[:id])
    erb :edit
  end

  # update
  patch "/orders/:id" do
    @order = Order.find(params[:id])
    @order.update(params[:order])
    redirect to "/orders/#{ @order.id }"
  end

  #destroy
  delete "/orders/:id" do
    Order.destroy(params[:id])
    redirect to "/orders"
  end


end
