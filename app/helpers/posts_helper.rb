module PostsHelper
  def humanize(arg)
    arg.slice(0, 1).capitalize + arg.slice(1..-1) if arg
  end
end
