require "github_api"

github = Github::Issues.new oauth_token: 'ef3804aafc0c3097cb37ee03a0939396558d5ade', user: 'jvalentini', repo: 'new_hire_test'
github.create title: "Test", body: "Bug description goes here"
