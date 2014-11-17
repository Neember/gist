class GithubApisController < ApplicationController
  before_filter :authenticate_user!, only: [:gists, :create]

  def gists
    puller = SnippetPuller.new(current_user)
    @gists = puller.gists
  end

  def create
    
  end

  private

  def code
    params.require(:code)
  end
end