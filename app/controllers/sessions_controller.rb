class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: login_params[:name])
        if @user.password == login_params[:password]
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def signout
        session.destroy
        redirect_to root_path
    end

    private

    def login_params
        params.require("user").permit("name", "password")
    end

end
