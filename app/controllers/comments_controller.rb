class CommentsController < ApplicationController
    #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments.all
        if @comments.nil?
            
            flash.now[:alert] = "No comment was not found"
            
          end
    end
    def show
        @post = Post.find(params[:post_id])
        @comments = @post.comments.find(params[:id])
        if @comments.nil?
            
            flash.now[:alert] = "No comment was not found"
            
          end
    end
    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
    def edit   
        @comment = Comment.find(params[:id])
        @post = @comment.post 
    end
    def update
        @comment = Comment.find(params[:id])
        @post = @comment.post
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            flash.now[:alert] = "Your book was not found"
            render edit_comment, status: :unprocessable_entity
            
        end
    end
    def destroy
       
        @comment = Comment.find(params[:id])
        @post = @comment.post
        @comment.destroy
        redirect_to post_path(@post), status: :see_other
    end
    private
    def comment_params
        params.require(:comment).permit(:commenter,:body, :status)
    end
end
