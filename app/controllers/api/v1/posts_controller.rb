module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.published.order(score: :desc, created_at: :desc)
        render json: { status: 'SUCCESS', message: 'loaded posts', data: posts }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
      end
    end
  end
end
