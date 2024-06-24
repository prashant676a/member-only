class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # session[:user_id] = @user.id
            flash[:success] = "User created successfully."
            redirect_to new_user_path
        else
            flash.now[:error] = "User couldn't be created"
            
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
