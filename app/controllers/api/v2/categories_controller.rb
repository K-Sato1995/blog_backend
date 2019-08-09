module Api
  module V2
    class CategoriesController < ApplicationController
      include ApiHelper
      def index
        categories = Category.all
        render_json(categories: categories)
      end
    end
  end
end
