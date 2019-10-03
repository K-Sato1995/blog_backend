module Admin
  class CategoriesController < Admin::ApplicationController
    before_action :find_category, only: [:edit, :update, :destroy]

    def index
      @categories = Category.all
    end

    def update
      if @category.update(category_params)
        flash[:warning] = 'The category was successfully updated'
        redirect_to admin_categories_path
      else
        render 'edit'
      end
    end

    def destroy
      @category.destroy
      flash[:danger] = 'The category was successfully deleted'
      redirect_to admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
