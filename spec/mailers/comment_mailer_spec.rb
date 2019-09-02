require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  describe '.comment_email' do
    let(:post) { create(:post) }
    let(:comment) { create(:comment) }
    let(:mail) { described_class.comment_email(post.slug, comment.name, comment.content).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("You've received a comment")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['katsuki_sato0130@icloud.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['mandanglish@gmail.com'])
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match("https://k-sato1995.github.io/blog/#{post.slug}")
    end

    it 'assigns @commenter' do
      expect(mail.body.encoded).to match(comment.name)
    end

    it 'assigns @comment_content' do
      expect(mail.body.encoded).to match(comment.content)
    end
  end
end
