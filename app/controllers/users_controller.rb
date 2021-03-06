class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end 
  
    def create
        @user = User.new(user_params)
        # @user.admin = false unless @user.admin == "true"
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to users_path
        end
    end

    def index

    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require("user").permit("name", "password", "nausea", "happiness", "tickets", "height", "admin")
    end

    def require_login
        redirect_to root_path unless session.include? :user_id
    end

end
