class UserController < ApplicationController



    get "/error" do
      erb :error
    end

    get "/" do
        erb :welcome
      end

    get "/welcome" do
      erb :welcome
    end

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


  get "logout" do
    session.clear
    redirect "/"
    end

  get "/login" do
    erb :login
  end

  get "/error" do
        if logged_in?
            erb :welcome
        else
        redirect "/error"
        end
      end

  post "/login" do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/welcome'
    else

      redirect '/error'
      end
   end


  end
end
  #assigns current session to user
