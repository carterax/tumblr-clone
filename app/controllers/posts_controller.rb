class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC');
	end

	def new 
		@post = Post.new
	end

	def create
		#create a new instance of the Post Model
		#Pass a post param arguement 
		#save the post param arguement
		#Redirect to the post in particular
		@post = Post.new(post_params)

		if @post.save
		   redirect_to @post
		else
		   render "new"
		end
	end

	def show
		#find the post by id 
		#and make the instance variable post available to
		#the show view
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to root_path
	end

	private

	 #in the post params method
	 def post_params
	 	params.require(:post).permit(:title, :body)
	 end
end
