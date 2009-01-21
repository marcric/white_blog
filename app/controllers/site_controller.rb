class SiteController < ApplicationController
 layout "site"

 def index
   @posts = Post.last
   if not @post.nil?  # added by MarcRic 2008-01-18
    get_comment_user_for_post(@posts)
   end  # added by MarcRic 2008-01-18
 end

  def add_comment_for_post
     @comment = Comment.new(params[:comment])

     if @comment.save
		redirect_to :action => "read", :id => params[:comment][:post_id]
     else
       redirect_to :action => "read", :id => params[:comment][:post_id]
     end

  end

  def read
    if request.get? && !params[:id].empty?
	  @posts = Post.find(params[:id])
	  get_comment_user_for_post(@posts)	
	  render :action => "index"
	end
  end

  private

  def get_comment_user_for_post(posts)
      @comments = posts.comments.all
      @user = User.find(posts.user_id)
  
      @comment = Comment.new
 
   end
end
