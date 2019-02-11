module PostsHelper
  def posts_data
    Category.all.includes(:posts).each_with_object({}) { |category, hash| hash[category.name.to_s] = category.posts.size }
  end

  def posts_status
    draft_posts_num = Post.draft.size
    published_posts_num = Post.published.size
    private_posts_num = Post.confidential.size
    { Draft: draft_posts_num, Published: published_posts_num, Private: private_posts_num }
  end

  def chart_colors
    %w[#F1948A #D6EAF8 #F9E79F #EBF5FB #E6B0AA #D5F5E3]
  end

  def chart_colors2
    %w[#F9E79F #A3E4D7 #F1948A]
  end

  def error_check(num = 1)
    return "There is #{num} error." if num == 1
    "There are #{num} errors."
  end

  def initial_value
  <<-TEXT
# Introduction
# Table of contents
  1.[]
  -[]()
  -[]()
  -[]()
  -[]()
  -[]()
  -[]()
#
#
#
#
  TEXT
  end
end
