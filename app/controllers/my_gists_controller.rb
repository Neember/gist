class MyGistsController < ApplicationController
  def new
    @my_gist = MyGist.new
  end

  def create
    @my_gist = MyGist.new(create_params)

    if @my_gist.save
      flash[:notice] = 'Gist created successfully'
      redirect_to new_my_gist_url
    else
      render :new
    end
  end

  private

  def create_params

    params.require(:my_gist).permit(:title, :content)
  end
end
