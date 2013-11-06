require 'rubygems'
require 'bundler/setup'
require "github_api"
require "bitbucket_rest_api"

github = Github::Issues.new login: "jvalentini", password: "", user: 'jvalentini', repo: 'new_hire_test'
github.create title: "New bug", body: "Bug description goes here"

bitbucket = BitBucket.new basic_auth: "jvalentini:"
bitbucket.issues.create "jvalentini", "new_hire_test", title: "New bug"
