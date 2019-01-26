module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.published.order(score: :desc, created_at: :desc)
        post_tags = Post.published.order(score: :desc, created_at: :desc).map { |post| Post.find_by(id: post.id).tags }
        categories = Category.all
        tags = Tag.all.map { |tag| Tag.find_by(name: tag.name).posts }
        render json: { status: 'SUCCESS', message: 'loaded posts', data: { posts: posts, categories: categories, tags: tags, post_tags: post_tags } }
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the post', data: post }
      end
    end
  end
end
