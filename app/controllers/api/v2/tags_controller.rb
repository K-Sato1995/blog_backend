module Api
  module V2
    class TagsController < ApplicationController
      skip_before_action :verify_authenticity_token
      include ApiHelper
      def index
        tags = Tag.all
        render_json(tags: tags)
      end
    end
  end
end
