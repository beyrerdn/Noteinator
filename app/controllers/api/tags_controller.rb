class Api::TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    render json: @tag
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save do
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end


  private

  def tag_params
    params.permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
