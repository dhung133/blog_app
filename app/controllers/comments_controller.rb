class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
      @comment = current_user.comments.build(comment_params)
      @entry = Entry.find(@comment.entry_id)
      if @comment.save
        flash[:success] = "comment created!"
        redirect_to :back
      else
        flash[:alert] = "Check the comment form, something went wrong."
        redirect_to :back
      end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @entry = @comment.entry
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :entry_id)
    end
end
