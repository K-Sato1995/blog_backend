module Admin
  class CommentsController < Admin::ApplicationController
    include ApplicationHelper
    before_action :authenticate_author
    before_action :find_comment, only: [:edit, :update, :destroy]

    def index
      @comments = Comment.all
    end

    def update
      if @comment.update(comment_params)
        flash[:warning] = 'The comment was successfully updated'
        redirect_to admin_comments_path
      else
        render 'edit'
      end
    end

    def destroy
      @comment.destroy
      flash[:danger] = 'The comment was successfully deleted'
      redirect_to admin_comments_path
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :content, :status)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
  end
end
