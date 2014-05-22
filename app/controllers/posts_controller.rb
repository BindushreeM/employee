class PostsController < ApplicationController
def index
		@comment=Comment.new
    end

	def new
		@comment = Comment.find(params[:id])
	end

	def create
		  @comment =  Comment.find(params[:comment_id])
		
      @post = @comment.posts.create(post_params)
    redirect_to comment_path(@comment)
  end
	
	def show
		@comment = Comment.find(params[:id])
	end

	private
	def post_params
		params.require(:post).permit(:poster, :comment_id)
	end
end
