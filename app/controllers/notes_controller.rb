class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    @notes = Note.all
    render json: @notes
  end

  def show
    render json: @note
  end

  def create
    @note = Note.new(note_params)

    if params[:note][:categories].is_a?(String)
      params[:note][:categories] = JSON.parse(params[:note][:categories])
    end

    @note.categories ||= []

    params[:note][:categories].each do |category|
      @note.categories << category
    end

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    head :no_content
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :categories, :reminder_date)
  end
end
