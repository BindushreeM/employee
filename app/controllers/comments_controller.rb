class CommentsController < ApplicationController
	def index
		@comment=Comment.new
    end

	def new
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
        if @comment.save
		   redirect_to comments_path
		else
		  render 'new'
		end
	end
	
	def show
		@comment = Comment.find(params[:id])
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :post_id)
	end
end
