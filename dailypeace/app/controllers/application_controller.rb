require './config/environment'

class ApplicationController < Sinatra::Base

        configure do
          set :public_folder, 'public'
          set :views, 'app/views'
          enable :sessions
          set :session_secret, "secret"
        end


        def current_user
          User.find_by_id(session[:id])
        end

     def current_user
        User.find_by_id(session[:id])
         end

     def logged_in?
         !!session[:user_id]
         end

    def redirect_if_not_logged_in
        if !logged_in?
          flash[:error] = "you must be logged in to view that page"
          redirect request.referrer || "/login"
        end
      end
    end
