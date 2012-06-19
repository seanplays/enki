class PostsController < ApplicationController
  
  def index
    @tag = params[:tag]
    @posts = Post.find_recent(:tag => @tag, :include => :tags)
    @subtitle = @posts.first.tags.first.name rescue ""

    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end

  def show 
    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @subtitle = @post.tags.first.name rescue ""
    @comment = Comment.new
  end

  
end
