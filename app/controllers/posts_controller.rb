class PostsController < ApplicationController
  def index
    @posts = Post.all.order(create_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id]) #controllerから:idの値を取り出す find_by(id: 1)
  end

  def new

  end

  def create
    @post = Post.new(content: params[:cont])
    @post.save
    redirect_to("/posts/index")
  end
end
