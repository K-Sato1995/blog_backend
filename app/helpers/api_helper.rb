module ApiHelper
  def render_json(data)
    render json: { status: 'SUCCESS', message: 'loaded posts', data: data }
  end

  def index_attributes
    Post.column_names - %w[user_id image page_views content status created_at updated_at]
  end

  def show_attributes
    Post.column_names - %w[image]
  end

  def featured_posts_attributes
    %w[id title slug]
  end
end
