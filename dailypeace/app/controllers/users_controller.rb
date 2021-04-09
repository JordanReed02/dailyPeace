class UserController < ApplicationController

  get "/signup" do
    erb :signup

  end

post "/signup" do
  user = User.new(email: params[:email], username: params[:username], password_digest: params[:password])

  if user.save
    redirect '/welcome'
  else
    redirect '/failure'
  end
end


  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by_email(params[:email])
    if user && user.authenticate(password_digest: params[:password])
      session[:user_id] = user.id
      redirect '/welcome'
    else
      @error = "Incorrect email or password"
      erb :login
      end
   end

  get "/welcome" do
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
