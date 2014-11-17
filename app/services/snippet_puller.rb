class SnippetPuller
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_data
    SnippetPuller.get_data("https://api.github.com/users/#{user.username}")
  end

  def gists
    SnippetPuller.get_data("https://api.github.com/users/#{user.username}/gists")
  end

  def self.gist(code)
    get_data("https://api.github.com/gists/#{code}")
  end

  def pull(code)
    gist = SnippetPuller.gist(code)

  end

  private

  def self.get_data(link)
    response = Faraday.get link
    result = JSON.parse(response.body)
  end
end
