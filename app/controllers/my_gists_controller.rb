class MyGistsController < ApplicationController
  def new
    @my_gist = MyGist.new
  end
end