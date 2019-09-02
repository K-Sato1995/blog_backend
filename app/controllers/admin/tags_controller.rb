module Admin
  class TagsController < ApplicationController
    before_action :find_tag, only: [:edit, :update, :destroy]

    def index
      @tags = Tag.all
    end

    def update
      if @tag.update(tag_params)
        flash[:warning] = 'The tag was successfully updated'
        redirect_to admin_tags_path
      else
        render 'edit'
      end
    end

    def destroy
      @tag.destroy
      flash[:danger] = 'The tag was successfully deleted'
      redirect_to admin_tags_path
    end

    private

    def tag_params
      params.require(:tag).permit(:name)
    end

    def find_tag
      @tag = Tag.find(params[:id])
    end
  end
end
