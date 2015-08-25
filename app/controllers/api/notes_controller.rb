class Api::NotesController < ApplicationController
  before_action :set_note, only: [:show]

  def index
    @notes = Note.all
    render json: @notes
  end

  def show
    render json: @note
  end

  def create
    @note = Note.create(note_params)
      if @note.save
        render json: @note, status: :created
      else
        render json: @note.errors, status: :unprocessable_entity
      end
  end

  def by_tag
    @notes = Tag.find_by_name(params[:name]).notes
    render json: @notes
  end


  private

  def note_params
    params.permit(:title, :body, :tags)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
