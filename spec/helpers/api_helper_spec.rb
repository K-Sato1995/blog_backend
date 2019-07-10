require 'rails_helper'

RSpec.describe ApiHelper, type: :helper do
  before { class K; include ApiHelper; end }
  let(:ins) { K.new }

  describe "Api helper methods" do
    it "show_attributes" do
      expect(ins.show_attributes).to eq(["id", "title", "content", "status", "created_at", "updated_at", "user_id", "category_id", "score", "page_views", "introduction", "language", "like"])
    end

    it "index_attributes" do
      expect(ins.index_attributes).to eq(["id", "title", "status", "created_at", "updated_at", "category_id", "score", "introduction", "language", "like"])
    end
  end
end
