module Api
  module V1
    class CommentsController < ApplicationController
      def create
        @comment = Comment.create(comment_params)
      end

      private

      def comment_params
        params.permit(:name, :content)
      end
    end
  end
end
