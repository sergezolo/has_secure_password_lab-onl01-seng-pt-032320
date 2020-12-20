class SessionsController < ApplicationController

    def new 
        @user = User.new 
    end

    def create
        @user = User.find_by(name: user_params[:name])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            redirect_to login_path
        end
    end

    def destroy 
        session.clear[:user_id]
        redirect_to '/login'  
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
