class GithubApisController < ApplicationController
  before_filter :authenticate_user!, only: [:gists]

  def gists
    puller = SnippetPuller.new(current_user)
    @gists = puller.gists
  end
end