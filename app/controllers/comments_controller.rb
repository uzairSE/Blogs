class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    
    def show
        @post = Post.find(params[:post_id])
        @comments = @post.comments.find(params[:id])
    end
    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
    def edit   
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])     
    end
    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render edit_comment, status: :unprocessable_entity
        end
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), status: :see_other
    end
    private
    def comment_params
        params.require(:comment).permit(:commenter,:body, :status)
    end
end
