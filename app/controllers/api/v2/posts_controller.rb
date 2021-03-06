module Api
  module V2
    class PostsController < ApplicationController
      include ApiHelper
      def index
        posts = Post.select(index_attributes).published.order(score: :desc, created_at: :desc)
        post_tags = Post.published.order(score: :desc, created_at: :desc).map { |post| Post.includes(:tags, :taggings).find_by(id: post.id).tags }
        render_json(posts: posts, post_tags: post_tags)
      end

      def show
        post = Post.friendly.select(show_attributes).find(params[:id])
        comments = post.comments.published.includes(:post)
        post.update(page_views: post.page_views += 1)
        render_json(post: post, comments: comments)
      end

      def like
        post = Post.find(params[:id])
        post.update(like: post.like += 1)
        render_json(post)
      end

      def featured_posts
        posts = Post.select(featured_posts_attributes).published.order(score: :desc, created_at: :desc).limit(5)
        render_json(posts: posts)
      end
    end
  end
end
