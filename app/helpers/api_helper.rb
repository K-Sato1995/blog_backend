module ApiHelper
  def render_json(data)
    render json: { status: 'SUCCESS', message: 'loaded posts', data: data }
  end

  def p_attributes
    Post.column_names - %w[user_id image page_views]
  end
end
