module PostsHelper
  def posts_data
    data = {}
    Category.all.includes(:posts).map { |category| data[category.name.to_s] = category.posts.size }
    data
  end

  def posts_status
    draft_posts_num = Post.where("status = '0'").size
    published_posts_num = Post.where("status = '1'").size
    private_posts_num = Post.where("status = '2'").size
    { Draft: draft_posts_num, Published: published_posts_num, Private: private_posts_num }
  end

  def chart_colors
    %w[#F1948A #D6EAF8 #F9E79F #EBF5FB #E6B0AA #D5F5E3]
  end

  def chart_colors2
    %w[#F9E79F #A3E4D7 #F1948A]
  end

  def initial_value
    "# Introduction\n\n# Table of contents\n1. []()\n- []()\n- []()\n- []()\n- []()\n- []()\n- []()\n\n#\n#\n#\n#"
  end

  def error_check(num)
    num == 1 ? "There is #{num} error." : "There are #{num} errors"
  end
end
