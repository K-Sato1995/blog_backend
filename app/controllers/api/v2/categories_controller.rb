module Api
  module V2
    class CategoriesController < ApplicationController
      skip_before_action :verify_authenticity_token
      include ApiHelper
      def index
        categories = Category.all
        render_json(categories: categories)
      end
    end
  end
end
