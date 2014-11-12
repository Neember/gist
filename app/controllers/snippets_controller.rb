class SnippetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index  
    @snippets = Snippet.all unless current_user
    @snippets = Snippet.where(user: current_user) if current_user
  end

  def show
    @snippet = Snippet.find(snippet_id)
    render :show
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(create_params)

    if @snippet.save
      redirect_to snippets_url, notice: 'Snippet created successfully.'
    else
      render :new
    end
  end

  def edit
    @snippet = Snippet.find(snippet_id)
    unless @snippet.belongs_to?(current_user)
      redirect_to snippets_url, notice: 'You are not allowed to edit this snippet'
    end
  end

  def update
    @snippet = Snippet.find(snippet_id)
    unless @snippet.belongs_to?(current_user)
      return redirect_to snippets_url, notice: 'You are not allowed to update this snippet'
    end

    if @snippet.update_attributes(update_params)
      redirect_to snippet_url(@snippet), notice: "Snippet updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @snippet = Snippet.find(snippet_id)
    
    unless @snippet.belongs_to?(current_user)
      return redirect_to snippets_url, notice: 'You are not allowed to delete this snippet'
    end

    flash[:notice] = "Snippet deleted successfully." if @snippet.destroy
    redirect_to snippets_url
  end

  def search
    @snippets = Snippet.where("title ILIKE ?", "%#{keyword}%")
    @keyword = keyword
    render :index
  end

  private

  def create_params
    data = params.require(:snippet).permit(:title, :content, :status, tag_ids: [])
    data[:user] = current_user
    data
  end

  def update_params
    create_params
  end

  def snippet_id
    params.require(:id)
  end

  def keyword
    params.fetch(:q, '')
  end
end