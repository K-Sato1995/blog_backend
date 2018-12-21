module PostsHelper
  def posts_data
    data = {}
    Category.all.includes(:posts).map { |category| data[category.name.to_s] = category.posts.size }
    data
  end

  def posts_status
    draft_posts = Post.where("status = '0'").size
    published_posts = Post.where("status = '1'").size
    private_posts = Post.where("status = '2'").size
    { Draft: draft_posts, Published: published_posts, Private: private_posts }
  end

  def chart_colors
    ['#F1948A', '#D6EAF8', '#F9E79F', '#EBF5FB', '#E6B0AA', '#D5F5E3']
  end

  def chart_colors2
    ['#F9E79F', '#A3E4D7', '#F1948A']
  end

  def initial_value
    "# Introduction\n\n# Table of contents\n1. []()\n- []()\n- []()\n- []()\n- []()\n- []()\n- []()\n\n#\n#\n#\n#"
  end

  def error_check(num)
    if num == 1
      "There is #{num} error."
    else
      "There are #{num} errors"
    end
  end
end
