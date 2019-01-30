module Api
  module V1
    class PostsController < ApplicationController
      include ApiHelper
      def index
        posts = Post.select(p_attributes).published.order(score: :desc, created_at: :desc)
        post_tags = Post.published.order(score: :desc, created_at: :desc).map { |post| Post.find_by(id: post.id).tags }
        categories = Category.all
        tags = Tag.all

        render_json(posts: posts, categories: categories, tags: tags, post_tags: post_tags)
      end

      def show
        post = Post.select(p_attributes).find(params[:id])
        render_json(post)
      end
    end
  end
end
