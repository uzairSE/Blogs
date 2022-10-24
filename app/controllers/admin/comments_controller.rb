class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    
    def show
        @posts = Post.find(params[:post_id])
        @comments = @post.comments.find(params[:id])
    end
    def create 
        @posts = Post.find(params[:post_id])
        @comments = @posts.comments.create(comment_params)
        redirect_to post_path(@posts)
    end
    def edit   
        @posts = Post.find(params[:post_id])
        @comments = @posts.comments.find(params[:id])     
    end
    def update
        @posts = Post.find(params[:post_id])
        @comments = @posts.comments.find(params[:id])
        if @comments.update(comment_params)
            redirect_to post_path(@posts)
        else
            render edit_comment, status: :unprocessable_entity
        end
    end
    def destroy
        @posts = Post.find(params[:post_id])
        @comment = @posts.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@posts), status: :see_other
    end
    private
    def comment_params
        params.require(:comment).permit(:commenter,:body, :status)
    end
end
