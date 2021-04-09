class UserController < ApplicationController

  get "/signup" do
    erb :signup

  end

post "/signup" do
  user = User.new(email: params[:email], username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
     redirect '/'
  else
    erb :signup
  end
end


  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
    if user.save
      session[:id] = user.id
      redirect '/'
    else
      @error = "Incorrect email or password"
      erb :login
      end
   end

  get "/login" do
      if logged_in?
          erb :welcome
      else
      redirect "/login"
      end
    end

  get "/failure" do
    erb :failure
    end

  get "logout" do
    session.clear
    redirect "/"
  end

  #assigns current session to user
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
      end
    end
  end
end
