module ApplicationHelper
  def qiita_markdown(markdown)
   processor = Qiita::Markdown::Processor.new(hostname: "example.com")
   processor.call(markdown)[:output].to_s.html_safe
  end
end
