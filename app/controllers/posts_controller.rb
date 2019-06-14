class PostsController < ApplicationController

	http_basic_authenticate_with name: "brad", password: "password", except: [:index, :show, :new, :create, :edit, :update, :destroy]

	def index
		@posts = Post.all #shows all posts
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 
		@post = Post.new
	end

	def create 
		#render plain: params[:post].inspect
		@post = Post.new(post_params) 

		if(@post.save)
			redirect_to @post #loads the show view
		else
			render 'new' #re-renders form if error
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update 
		@post = Post.find(params[:id])
		if(@post.update(post_params))
			redirect_to @post #loads the show view
		else
			render 'edit' #re-renders form if error
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end


	private def post_params
		params.require(:post).permit(:title, :body) #where :post(form values) is the parameters
	end
end
