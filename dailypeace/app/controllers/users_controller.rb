class UserController < ApplicationController

  get "/signup" do
    erb :signup

  end

post "/signup" do
  user = User.new(email: params[:email], password_digest: params[:password])

  if user.save
    redirect '/welcome'
  else
    redirect '/failure'
  end
end
end
