class CommentMailer < ApplicationMailer
  def comment_email(post_slug, commenter, comment_content)
    @url = "https://k-sato1995.github.io/blog/#{post_slug}"
    @commenter = commenter
    @comment_content = comment_content
    mail(from: 'K-Sato <mandanglish@gmail.com>', to: 'katsuki_sato0130@icloud.com', subject: "You've received a comment")
  end
end
