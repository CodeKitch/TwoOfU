class SessionsController < ApplicationController

    def home

    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
        else
            flash[:message] = "Magic didn't happen during login, please try again!"
            redirect_to '/login'
        end
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/signin'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end
