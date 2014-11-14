RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://api.github.com/users/Johnytran/gists").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
      to_return(status: 200, headers: {}, body: '[
                                                  {
                                                    "url": "https://api.github.com/gists/55599a17e859093bc085",
                                                    "forks_url": "https://api.github.com/gists/55599a17e859093bc085/forks",
                                                    "commits_url": "https://api.github.com/gists/55599a17e859093bc085/commits",
                                                    "id": "55599a17e859093bc085",
                                                    "git_pull_url": "https://gist.github.com/55599a17e859093bc085.git",
                                                    "git_push_url": "https://gist.github.com/55599a17e859093bc085.git",
                                                    "html_url": "https://gist.github.com/55599a17e859093bc085",
                                                    "files": {
                                                      "RVM.md": {
                                                        "filename": "RVM.md",
                                                        "type": "text/plain",
                                                        "language": "Markdown",
                                                        "raw_url": "https://gist.githubusercontent.com/Johnytran/55599a17e859093bc085/raw/8036009a58d2434654550bcfb1d18b9866579aef/RVM.md",
                                                        "size": 1399
                                                      }
                                                    },
                                                    "public": true,
                                                    "created_at": "2014-11-06T03:08:25Z",
                                                    "updated_at": "2014-11-06T03:08:25Z",
                                                    "description": null,
                                                    "comments": 0,
                                                    "user": null,
                                                    "comments_url": "https://api.github.com/gists/55599a17e859093bc085/comments",
                                                    "owner": {
                                                      "login": "Johnytran",
                                                      "id": 9523491,
                                                      "avatar_url": "https://avatars.githubusercontent.com/u/9523491?v=3",
                                                      "gravatar_id": "",
                                                      "url": "https://api.github.com/users/Johnytran",
                                                      "html_url": "https://github.com/Johnytran",
                                                      "followers_url": "https://api.github.com/users/Johnytran/followers",
                                                      "following_url": "https://api.github.com/users/Johnytran/following{/other_user}",
                                                      "gists_url": "https://api.github.com/users/Johnytran/gists{/gist_id}",
                                                      "starred_url": "https://api.github.com/users/Johnytran/starred{/owner}{/repo}",
                                                      "subscriptions_url": "https://api.github.com/users/Johnytran/subscriptions",
                                                      "organizations_url": "https://api.github.com/users/Johnytran/orgs",
                                                      "repos_url": "https://api.github.com/users/Johnytran/repos",
                                                      "events_url": "https://api.github.com/users/Johnytran/events{/privacy}",
                                                      "received_events_url": "https://api.github.com/users/Johnytran/received_events",
                                                      "type": "User",
                                                      "site_admin": false
                                                    }
                                                  }
                                                ]')
  
    stub_request(:get, "https://api.github.com/users/Johnytran").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
      to_return(status: 200, headers: {}, body: '{
                        "login": "Johnytran",
                        "id": 9523491,
                        "avatar_url": "https://avatars.githubusercontent.com/u/9523491?v=3",
                        "gravatar_id": "",
                        "url": "https://api.github.com/users/Johnytran",
                        "html_url": "https://github.com/Johnytran",
                        "followers_url": "https://api.github.com/users/Johnytran/followers",
                        "following_url": "https://api.github.com/users/Johnytran/following{/other_user}",
                        "gists_url": "https://api.github.com/users/Johnytran/gists{/gist_id}",
                        "starred_url": "https://api.github.com/users/Johnytran/starred{/owner}{/repo}",
                        "subscriptions_url": "https://api.github.com/users/Johnytran/subscriptions",
                        "organizations_url": "https://api.github.com/users/Johnytran/orgs",
                        "repos_url": "https://api.github.com/users/Johnytran/repos",
                        "events_url": "https://api.github.com/users/Johnytran/events{/privacy}",
                        "received_events_url": "https://api.github.com/users/Johnytran/received_events",
                        "type": "User",
                        "site_admin": false,
                        "name": "",
                        "company": "",
                        "blog": "",
                        "location": "",
                        "email": "",
                        "hireable": false,
                        "bio": null,
                        "public_repos": 0,
                        "public_gists": 1,
                        "followers": 0,
                        "following": 0,
                        "created_at": "2014-11-03T02:42:47Z",
                        "updated_at": "2014-11-13T02:43:03Z"
                      }')
  end
end