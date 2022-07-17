class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id]) #controllerから:idの値を取り出す find_by(id: 1)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:cont])
    if @post.save
      flash[:notice] = "投稿したちい"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "編集したちい"
      redirect_to("/posts/index")
    else
      render("posts/edit") #renderを使うとdef edit経由せずにeditHTMLに行けるので入力した文字が消えない
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    flash[:notice] = "消しちゃったってコト⁉"
    redirect_to("/posts/index")
  end


end
