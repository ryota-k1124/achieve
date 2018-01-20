class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @IMG = current_user.id
    #binding.pry
    #raise
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    ##Blog.create(blogs_params)
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      # ビューヘルパーの「rake routesのprefix_path」でルーティングにリンク
      redirect_to blogs_path, notice: "ブログを作成しました"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new' # newのViewへ(new.html.erb)
    end
  end

  def edit
    #@blog = Blog.find(params[:id])
  end

  def update
    #@blog = Blog.find(params[:id])
    ##@blog.update(blogs_params)
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    #@blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid? # if文1行書き 実行文 if 条件
  end
  
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
## ストロングパラメータ
## paramsメソッドにて取得した値の内、blogのtitleとcontentだけ取り込み
  private
   def blogs_params
      params.require(:blog).permit(:title, :content, :id)
   end

   # idをキーとして値を取得するメソッド
   def set_blog
    @blog = Blog.find(params[:id])
   end
end
