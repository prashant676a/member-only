class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            flash[:alert] = "Post Saved Successfully."
            redirect_to root_path
        else
            flash.now[:error] = "Post couldn't be created. Try again."
            render :new, status: :unprocessable_entity
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:user, :content)
        .with_defaults(user: current_user)
    end

end
