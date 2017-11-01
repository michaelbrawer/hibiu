class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    render 'charles/show'
  end

  def tag_params
    params.require(:tag).permit(:title, :content, :image, :all_tags, :tag, :keyword)
  end

end