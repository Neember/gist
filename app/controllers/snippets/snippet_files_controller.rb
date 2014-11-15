class Snippets::SnippetFilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_filter :grab_snippet_from_snippet_id

  def new 
    @snippet_file = @snippet.snippet_files.new
  end

  private 
  
  def snippet_id
    params.require(:snippet_id)
  end

  def grab_snippet_from_snippet_id 
    @snippet = Snippet.find(snippet_id)
  end
end