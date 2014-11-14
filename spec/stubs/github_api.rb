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

    stub_request(:get, "https://api.github.com/gists/55599a17e859093bc085").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
      to_return(status: 200, headers: {}, body: '{
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
                            "size": 1399,
                            "truncated": false,
                            "content": "## Installing RVM\n\n```sh\n# install RVM\ncurl -L https://get.rvm.io | bash -s stable\n\n# runs RVM\nsource /etc/profile.d/rvm.sh\n\n# Setups required files for RVM\nrvm requirements --autolibs=enable\n```\n\n\n## Ruby Version Management\n- RVM manages your ruby installation\n\n```sh\n# Install Ruby\nrvm install 2.0.0\n\n# Config RVM to use ruby 2.0.0\nrvm use 2.0.0\nrvm --default 2.0.0\n```\n\n## Gemset Management\n- RVM manages your Gem dependencies by allowing you to install Gems in its own directory\n- If your project directory has a `Gemfile` (which just contains a single-line text of your project name), RVM will bundle gems in its directory for that project\n- RVM also has a default and global gemset  \n  **global**: When a gemset is installing a gem, it will first lookup in the global gemset to find if it is already downloaded. Hence, it makes installing faster. It is a good idea to pre-install many gems in your global so your projects starts faster.  \n  **default**: If a directory does not have a Gemfile, it will automatically use this gemset. (Why would you do this?)\n- Be sure to install bundler: `gem install bundler`\n\n```sh\n# Recipe to install gems into gemset\n# List all your gemsets\nrvm gemset list\n\n# Use the global gemset\nrvm gemset use global\n\n# Create your Gemfile and then run bundle install\n# Gems are installed into your global gemset\n```\n\n## Notes\n- RVM stores all the gems in `~/.rvm/gems`"
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
                        },
                        "fork_of": {
                          "url": "https://api.github.com/gists/1932ee6978dad66f8c65",
                          "forks_url": "https://api.github.com/gists/1932ee6978dad66f8c65/forks",
                          "commits_url": "https://api.github.com/gists/1932ee6978dad66f8c65/commits",
                          "id": "1932ee6978dad66f8c65",
                          "git_pull_url": "https://gist.github.com/1932ee6978dad66f8c65.git",
                          "git_push_url": "https://gist.github.com/1932ee6978dad66f8c65.git",
                          "html_url": "https://gist.github.com/1932ee6978dad66f8c65",
                          "files": {

                          },
                          "public": true,
                          "created_at": "2014-06-17T10:38:58Z",
                          "updated_at": "2014-11-06T03:08:25Z",
                          "description": null,
                          "comments": 0,
                          "user": null,
                          "comments_url": "https://api.github.com/gists/1932ee6978dad66f8c65/comments",
                          "owner": {
                            "login": "jamesfwz",
                            "id": 6902971,
                            "avatar_url": "https://avatars.githubusercontent.com/u/6902971?v=3",
                            "gravatar_id": "",
                            "url": "https://api.github.com/users/jamesfwz",
                            "html_url": "https://github.com/jamesfwz",
                            "followers_url": "https://api.github.com/users/jamesfwz/followers",
                            "following_url": "https://api.github.com/users/jamesfwz/following{/other_user}",
                            "gists_url": "https://api.github.com/users/jamesfwz/gists{/gist_id}",
                            "starred_url": "https://api.github.com/users/jamesfwz/starred{/owner}{/repo}",
                            "subscriptions_url": "https://api.github.com/users/jamesfwz/subscriptions",
                            "organizations_url": "https://api.github.com/users/jamesfwz/orgs",
                            "repos_url": "https://api.github.com/users/jamesfwz/repos",
                            "events_url": "https://api.github.com/users/jamesfwz/events{/privacy}",
                            "received_events_url": "https://api.github.com/users/jamesfwz/received_events",
                            "type": "User",
                            "site_admin": false
                          }
                        },
                        "forks": [

                        ],
                        "history": [
                          {
                            "user": {
                              "login": "ivan22",
                              "id": 6119885,
                              "avatar_url": "https://avatars.githubusercontent.com/u/6119885?v=3",
                              "gravatar_id": "",
                              "url": "https://api.github.com/users/ivan22",
                              "html_url": "https://github.com/ivan22",
                              "followers_url": "https://api.github.com/users/ivan22/followers",
                              "following_url": "https://api.github.com/users/ivan22/following{/other_user}",
                              "gists_url": "https://api.github.com/users/ivan22/gists{/gist_id}",
                              "starred_url": "https://api.github.com/users/ivan22/starred{/owner}{/repo}",
                              "subscriptions_url": "https://api.github.com/users/ivan22/subscriptions",
                              "organizations_url": "https://api.github.com/users/ivan22/orgs",
                              "repos_url": "https://api.github.com/users/ivan22/repos",
                              "events_url": "https://api.github.com/users/ivan22/events{/privacy}",
                              "received_events_url": "https://api.github.com/users/ivan22/received_events",
                              "type": "User",
                              "site_admin": false
                            },
                            "version": "b33084d456e83bb03a61cb12d02203e11dc92537",
                            "committed_at": "2014-05-17T03:11:48Z",
                            "change_status": {
                              "total": 48,
                              "additions": 48,
                              "deletions": 0
                            },
                            "url": "https://api.github.com/gists/55599a17e859093bc085/b33084d456e83bb03a61cb12d02203e11dc92537"
                          }
                        ]
                      }')
  end
end