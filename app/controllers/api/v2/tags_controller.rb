module Api
  module V2
    class TagsController < ApplicationController
      include ApiHelper
      def index
        tags = Tag.all
        render_json(tags: tags)
      end
    end
  end
end
