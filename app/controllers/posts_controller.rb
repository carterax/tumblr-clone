class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC');
	end

	def new 
	end

	def create
		#create a new instance of the Post Model
		#Pass a post param arguement 
		#save the post param arguement
		#Redirect to the post in particular
		@post = Post.new(post_params)
		@post.save

		redirect_to @post
	end

	def show
		#find the post by id 
		#and make the instance variable post available to
		#the show view
		@post = Post.find(params[:id])
	end

	private

	 #in the post params method
	 def post_params
	 	params.require(:post).permit(:title, :body);
	 end
end
