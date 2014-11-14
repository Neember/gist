class SnippetPuller
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_data
    get_data("https://api.github.com/users/#{user.username}")
  end

  def gists
    get_data("https://api.github.com/users/#{user.username}/gists")
  end

  private

  def get_data(link)
    response = Faraday.get link
    result = JSON.parse(response.body)
  end
end
