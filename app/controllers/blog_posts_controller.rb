# CRUD for blog posts
class BlogPostsController < ApplicationController
    def index
        # This will find all blog posts
        @posts = BlogPost.all
    end

    def show
        # This will find the blog post by id
        begin
            @post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render plain: "404 Blog post with id:#{params[:id]} Not Found", status: 404
        end
    end

    def new
        # This provides a new blog post model structure to the view
        @post = BlogPost.new
    end

    def create
        # This will create a new blog post from the params
        @post = BlogPost.new(params.require(:blog_post).permit(:title, :body))
        if @post.save
            redirect_to blog_post_path(@post)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        # This will find the blog post by id
        begin
            @post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render plain: "404 Blog post with id:#{params[:id]} Not Found", status: 404
        end
    end

    def update
        # This will find the blog post by id
        begin
            @post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render plain: "404 Blog post with id:#{params[:id]} Not Found", status: 404
        end
        # This will update the blog post from the params
        if @post.update(params.require(:blog_post).permit(:title, :body))
            redirect_to blog_post_path(@post)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        # This will find the blog post by id
        begin
            @post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render plain: "404 Blog post with id:#{params[:id]} Not Found", status: 404
        end
        # This will destroy the blog post
        @post.destroy
        redirect_to root_path
    end
end