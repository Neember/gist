class Snippets::SnippetFilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_filter :grab_snippet_from_snippet_id

  def new 
    @snippet_file = @snippet.snippet_files.new
  end

  def create
    @snippet_file = @snippet.snippet_files.new( snippet_file_params )
    p @snippet_file
    if @snippet_file.save
      redirect_to my_gists_snippets_path
    else
      render :new
    end
  end
  
  private 
  
  def snippet_id
    params.require(:snippet_id)
  end

  def grab_snippet_from_snippet_id 
    @snippet = Snippet.find(snippet_id)
  end

  def snippet_file_params
    params.require(:snippet_file).permit(:name, :content)
  end
end